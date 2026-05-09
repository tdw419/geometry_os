; DESCRIPTION: Composite: Draws a blue line from (376, 214) to (339, 109) then Renders a black box of size 20x40 starting at (237, 205).
; PLAN: r0=376(x1), r1=214(y1), r2=339(x2), r3=109(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=237(x), r6=205(y), r7=20(width), r8=40(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 376
LDI r1, 214
LDI r2, 339
LDI r3, 109
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 205
LDI r7, 20
LDI r8, 40
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT

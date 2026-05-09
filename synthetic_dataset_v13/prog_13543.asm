; DESCRIPTION: Composite: Renders a black box of size 11x94 starting at (379, 20) then Draws a purple line from (60, 161) to (223, 150).
; PLAN: r0=379(x), r1=20(y), r2=11(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=60(x1), r6=161(y1), r7=223(x2), r8=150(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 379
LDI r1, 20
LDI r2, 11
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 161
LDI r7, 223
LDI r8, 150
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT

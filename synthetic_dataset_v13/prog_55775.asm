; DESCRIPTION: Composite: Sets a single purple pixel at (350, 184) then Draws a green line from (109, 151) to (342, 190) then Renders a blue box of size 101x95 starting at (2, 36).
; PLAN: r0=350(x), r1=184(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=109(x1), r6=151(y1), r7=342(x2), r8=190(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=2(x), r11=36(y), r12=101(width), r13=95(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 350
LDI r1, 184
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 109
LDI r6, 151
LDI r7, 342
LDI r8, 190
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 2
LDI r11, 36
LDI r12, 101
LDI r13, 95
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT

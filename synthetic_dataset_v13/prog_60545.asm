; DESCRIPTION: Composite: Renders a black box of size 20x11 starting at (237, 164) then Draws a blue line from (85, 189) to (379, 185) then Places a orange dot at position (399, 190).
; PLAN: r0=237(x), r1=164(y), r2=20(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=85(x1), r6=189(y1), r7=379(x2), r8=185(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=399(x), r11=190(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 237
LDI r1, 164
LDI r2, 20
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 189
LDI r7, 379
LDI r8, 185
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 399
LDI r11, 190
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT

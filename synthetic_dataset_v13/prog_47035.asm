; DESCRIPTION: Composite: Draws a black line from (309, 154) to (485, 144) then Renders a red disk with center (190, 88) and radius 66 then Places a purple dot at position (448, 176).
; PLAN: r0=309(x1), r1=154(y1), r2=485(x2), r3=144(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=190(x), r6=88(y), r7=66(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=448(x), r11=176(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 309
LDI r1, 154
LDI r2, 485
LDI r3, 144
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 88
LDI r7, 66
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 448
LDI r11, 176
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT

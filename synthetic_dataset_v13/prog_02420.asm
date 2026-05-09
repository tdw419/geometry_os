; DESCRIPTION: Composite: Draws a orange line from (199, 188) to (456, 144) then Renders a black disk with center (122, 112) and radius 10 then Places a red dot at position (407, 134).
; PLAN: r0=199(x1), r1=188(y1), r2=456(x2), r3=144(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=122(x), r6=112(y), r7=10(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=407(x), r11=134(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 199
LDI r1, 188
LDI r2, 456
LDI r3, 144
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 112
LDI r7, 10
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 407
LDI r11, 134
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT

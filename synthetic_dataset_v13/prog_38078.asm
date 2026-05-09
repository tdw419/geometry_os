; DESCRIPTION: Composite: Draws a blue line from (389, 32) to (76, 22) then Renders a orange disk with center (194, 113) and radius 79 then Sets a single green pixel at (253, 236).
; PLAN: r0=389(x1), r1=32(y1), r2=76(x2), r3=22(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=194(x), r6=113(y), r7=79(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=253(x), r11=236(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 389
LDI r1, 32
LDI r2, 76
LDI r3, 22
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 113
LDI r7, 79
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 253
LDI r11, 236
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT

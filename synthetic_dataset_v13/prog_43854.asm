; DESCRIPTION: Composite: Draws a black line from (140, 251) to (373, 163) then Places a orange circle of radius 12 at center (219, 215) then Places a blue dot at position (265, 123).
; PLAN: r0=140(x1), r1=251(y1), r2=373(x2), r3=163(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=219(x), r6=215(y), r7=12(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=265(x), r11=123(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 140
LDI r1, 251
LDI r2, 373
LDI r3, 163
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 219
LDI r6, 215
LDI r7, 12
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 265
LDI r11, 123
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT

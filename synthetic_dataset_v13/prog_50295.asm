; DESCRIPTION: Composite: Draws a purple line from (41, 36) to (347, 125) then Renders a white disk with center (130, 144) and radius 45.
; PLAN: r0=41(x1), r1=36(y1), r2=347(x2), r3=125(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=130(x), r6=144(y), r7=45(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 41
LDI r1, 36
LDI r2, 347
LDI r3, 125
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 144
LDI r7, 45
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT

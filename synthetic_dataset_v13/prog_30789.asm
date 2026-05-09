; DESCRIPTION: Composite: Renders a black line between points (173, 164) and (115, 187) then Renders a black disk with center (400, 180) and radius 69 then Places a orange dot at position (369, 63).
; PLAN: r0=173(x1), r1=164(y1), r2=115(x2), r3=187(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=400(x), r6=180(y), r7=69(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=369(x), r11=63(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 173
LDI r1, 164
LDI r2, 115
LDI r3, 187
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 180
LDI r7, 69
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 369
LDI r11, 63
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT

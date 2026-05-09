; DESCRIPTION: Composite: Places a blue circle of radius 37 at center (184, 60) then Places a orange dot at position (338, 184) then Places a white line segment connecting (383, 229) to (375, 136).
; PLAN: r0=184(x), r1=60(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=338(x), r6=184(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=383(x1), r11=229(y1), r12=375(x2), r13=136(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 184
LDI r1, 60
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 338
LDI r6, 184
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 383
LDI r11, 229
LDI r12, 375
LDI r13, 136
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT

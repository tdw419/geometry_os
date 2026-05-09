; DESCRIPTION: Composite: Places a white dot at position (62, 196) then Places a purple line segment connecting (215, 76) to (83, 193) then Places a white circle of radius 10 at center (367, 51).
; PLAN: r0=62(x), r1=196(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=215(x1), r6=76(y1), r7=83(x2), r8=193(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=367(x), r11=51(y), r12=10(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 62
LDI r1, 196
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 215
LDI r6, 76
LDI r7, 83
LDI r8, 193
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 367
LDI r11, 51
LDI r12, 10
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT

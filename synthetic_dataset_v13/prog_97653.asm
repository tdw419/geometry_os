; DESCRIPTION: Composite: Places a orange line segment connecting (257, 204) to (434, 38) then Sets a single purple pixel at (327, 62) then Renders a purple disk with center (464, 124) and radius 28.
; PLAN: r0=257(x1), r1=204(y1), r2=434(x2), r3=38(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=327(x), r6=62(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=464(x), r11=124(y), r12=28(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 257
LDI r1, 204
LDI r2, 434
LDI r3, 38
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 62
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 464
LDI r11, 124
LDI r12, 28
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT

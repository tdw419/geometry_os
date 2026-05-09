; DESCRIPTION: Composite: Renders a green line between points (429, 68) and (405, 115) then Sets a single orange pixel at (409, 17) then Renders a white disk with center (482, 32) and radius 22.
; PLAN: r0=429(x1), r1=68(y1), r2=405(x2), r3=115(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=409(x), r6=17(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=482(x), r11=32(y), r12=22(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 429
LDI r1, 68
LDI r2, 405
LDI r3, 115
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 17
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 482
LDI r11, 32
LDI r12, 22
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT

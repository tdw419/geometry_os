; DESCRIPTION: Composite: Sets a single green pixel at (406, 255) then Places a orange line segment connecting (442, 55) to (170, 12) then Places a black circle of radius 55 at center (134, 145).
; PLAN: r0=406(x), r1=255(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=442(x1), r6=55(y1), r7=170(x2), r8=12(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=134(x), r11=145(y), r12=55(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 406
LDI r1, 255
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 442
LDI r6, 55
LDI r7, 170
LDI r8, 12
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 134
LDI r11, 145
LDI r12, 55
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT

; DESCRIPTION: Composite: Draws a orange line from (1, 70) to (10, 176) then Places a blue dot at position (245, 37) then Creates a white circular shape at (310, 175) with radius 80.
; PLAN: r0=1(x1), r1=70(y1), r2=10(x2), r3=176(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=245(x), r6=37(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=310(x), r11=175(y), r12=80(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 1
LDI r1, 70
LDI r2, 10
LDI r3, 176
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 37
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 310
LDI r11, 175
LDI r12, 80
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT

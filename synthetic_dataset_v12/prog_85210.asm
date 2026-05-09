; DESCRIPTION: Composite: Places a black line segment connecting (327, 249) to (206, 219) then Places a green circle of radius 38 at center (226, 91) then Places a orange dot at position (451, 250).
; PLAN: r0=327(x1), r1=249(y1), r2=206(x2), r3=219(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=226(x), r6=91(y), r7=38(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=451(x), r11=250(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 327
LDI r1, 249
LDI r2, 206
LDI r3, 219
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 226
LDI r6, 91
LDI r7, 38
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 451
LDI r11, 250
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT

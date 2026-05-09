; DESCRIPTION: Composite: Renders a orange line between points (371, 72) and (331, 254) then Places a magenta dot at position (191, 117) then Creates a green circular shape at (301, 219) with radius 25.
; PLAN: r0=371(x1), r1=72(y1), r2=331(x2), r3=254(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=191(x), r6=117(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=301(x), r11=219(y), r12=25(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 371
LDI r1, 72
LDI r2, 331
LDI r3, 254
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 117
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 301
LDI r11, 219
LDI r12, 25
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT

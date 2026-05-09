; DESCRIPTION: Composite: Places a cyan line segment connecting (255, 251) to (222, 25) then Sets a single blue pixel at (69, 129) then Creates a green circular shape at (352, 100) with radius 76.
; PLAN: r0=255(x1), r1=251(y1), r2=222(x2), r3=25(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=69(x), r6=129(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=352(x), r11=100(y), r12=76(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 255
LDI r1, 251
LDI r2, 222
LDI r3, 25
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 69
LDI r6, 129
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 352
LDI r11, 100
LDI r12, 76
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT

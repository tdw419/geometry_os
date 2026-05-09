; DESCRIPTION: Composite: Places a purple line segment connecting (510, 211) to (441, 205) then Sets a single green pixel at (495, 219) then Places a black circle of radius 21 at center (206, 125).
; PLAN: r0=510(x1), r1=211(y1), r2=441(x2), r3=205(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=495(x), r6=219(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=206(x), r11=125(y), r12=21(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 510
LDI r1, 211
LDI r2, 441
LDI r3, 205
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 495
LDI r6, 219
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 206
LDI r11, 125
LDI r12, 21
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT

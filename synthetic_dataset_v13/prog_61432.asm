; DESCRIPTION: Composite: Places a black circle of radius 60 at center (243, 135) then Sets a single green pixel at (283, 137) then Places a white line segment connecting (383, 251) to (331, 219).
; PLAN: r0=243(x), r1=135(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=283(x), r6=137(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=383(x1), r11=251(y1), r12=331(x2), r13=219(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 243
LDI r1, 135
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 283
LDI r6, 137
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 383
LDI r11, 251
LDI r12, 331
LDI r13, 219
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT

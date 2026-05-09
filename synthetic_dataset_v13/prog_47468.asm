; DESCRIPTION: Composite: Creates a magenta circular shape at (378, 116) with radius 17 then Places a red dot at position (459, 11) then Places a black line segment connecting (192, 85) to (269, 110).
; PLAN: r0=378(x), r1=116(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=459(x), r6=11(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=192(x1), r11=85(y1), r12=269(x2), r13=110(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 378
LDI r1, 116
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 459
LDI r6, 11
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 192
LDI r11, 85
LDI r12, 269
LDI r13, 110
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT

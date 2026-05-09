; DESCRIPTION: Composite: Sets a single blue pixel at (114, 194) then Creates a black circular shape at (192, 87) with radius 40 then Places a cyan line segment connecting (233, 96) to (246, 194).
; PLAN: r0=114(x), r1=194(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=192(x), r6=87(y), r7=40(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=233(x1), r11=96(y1), r12=246(x2), r13=194(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 114
LDI r1, 194
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 192
LDI r6, 87
LDI r7, 40
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 233
LDI r11, 96
LDI r12, 246
LDI r13, 194
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT

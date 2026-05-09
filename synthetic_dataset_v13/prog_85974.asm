; DESCRIPTION: Composite: Places a blue dot at position (363, 43) then Creates a magenta circular shape at (261, 92) with radius 49 then Places a purple line segment connecting (128, 116) to (433, 16).
; PLAN: r0=363(x), r1=43(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=261(x), r6=92(y), r7=49(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=128(x1), r11=116(y1), r12=433(x2), r13=16(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 363
LDI r1, 43
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 261
LDI r6, 92
LDI r7, 49
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 128
LDI r11, 116
LDI r12, 433
LDI r13, 16
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT

; DESCRIPTION: Composite: Creates a purple circular shape at (343, 139) with radius 78 then Places a green dot at position (328, 62) then Places a red line segment connecting (253, 17) to (171, 60).
; PLAN: r0=343(x), r1=139(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=328(x), r6=62(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=253(x1), r11=17(y1), r12=171(x2), r13=60(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 343
LDI r1, 139
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 328
LDI r6, 62
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 253
LDI r11, 17
LDI r12, 171
LDI r13, 60
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT

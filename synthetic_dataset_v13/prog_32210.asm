; DESCRIPTION: Composite: Places a cyan dot at position (163, 176) then Creates a white circular shape at (253, 208) with radius 23 then Places a black line segment connecting (90, 201) to (90, 68).
; PLAN: r0=163(x), r1=176(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=253(x), r6=208(y), r7=23(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=90(x1), r11=201(y1), r12=90(x2), r13=68(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 163
LDI r1, 176
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 253
LDI r6, 208
LDI r7, 23
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 90
LDI r11, 201
LDI r12, 90
LDI r13, 68
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT

; DESCRIPTION: Composite: Places a blue dot at position (308, 205) then Creates a white circular shape at (201, 159) with radius 39 then Places a orange line segment connecting (24, 109) to (110, 47).
; PLAN: r0=308(x), r1=205(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=201(x), r6=159(y), r7=39(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=24(x1), r11=109(y1), r12=110(x2), r13=47(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 308
LDI r1, 205
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 201
LDI r6, 159
LDI r7, 39
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 24
LDI r11, 109
LDI r12, 110
LDI r13, 47
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT

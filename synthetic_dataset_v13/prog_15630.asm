; DESCRIPTION: Composite: Places a black dot at position (209, 128) then Places a black line segment connecting (40, 39) to (26, 218) then Creates a yellow circular shape at (372, 12) with radius 10.
; PLAN: r0=209(x), r1=128(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=40(x1), r6=39(y1), r7=26(x2), r8=218(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=372(x), r11=12(y), r12=10(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 209
LDI r1, 128
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 40
LDI r6, 39
LDI r7, 26
LDI r8, 218
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 372
LDI r11, 12
LDI r12, 10
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT

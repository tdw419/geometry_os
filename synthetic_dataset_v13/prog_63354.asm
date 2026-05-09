; DESCRIPTION: Composite: Places a yellow 93x73 rectangle at position (350, 77) then Places a white line segment connecting (286, 178) to (469, 89) then Creates a purple circular shape at (260, 142) with radius 27.
; PLAN: r0=350(x), r1=77(y), r2=93(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=286(x1), r6=178(y1), r7=469(x2), r8=89(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=260(x), r11=142(y), r12=27(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 350
LDI r1, 77
LDI r2, 93
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 286
LDI r6, 178
LDI r7, 469
LDI r8, 89
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 260
LDI r11, 142
LDI r12, 27
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT

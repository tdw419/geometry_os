; DESCRIPTION: Composite: Places a black line segment connecting (131, 103) to (124, 106) then Renders a green box of size 104x62 starting at (153, 87) then Creates a white circular shape at (223, 164) with radius 44.
; PLAN: r0=131(x1), r1=103(y1), r2=124(x2), r3=106(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=153(x), r6=87(y), r7=104(width), r8=62(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=223(x), r11=164(y), r12=44(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 131
LDI r1, 103
LDI r2, 124
LDI r3, 106
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 153
LDI r6, 87
LDI r7, 104
LDI r8, 62
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 223
LDI r11, 164
LDI r12, 44
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT

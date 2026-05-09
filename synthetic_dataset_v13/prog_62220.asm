; DESCRIPTION: Composite: Places a red 62x83 rectangle at position (31, 107) then Places a red line segment connecting (448, 251) to (165, 189) then Creates a red circular shape at (442, 98) with radius 62.
; PLAN: r0=31(x), r1=107(y), r2=62(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=448(x1), r6=251(y1), r7=165(x2), r8=189(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=442(x), r11=98(y), r12=62(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 31
LDI r1, 107
LDI r2, 62
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 448
LDI r6, 251
LDI r7, 165
LDI r8, 189
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 442
LDI r11, 98
LDI r12, 62
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT

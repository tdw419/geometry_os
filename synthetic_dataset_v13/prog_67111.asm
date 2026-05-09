; DESCRIPTION: Composite: Draws a green circle centered at (266, 101) with radius 57 then Places a white line segment connecting (331, 107) to (477, 119) then Renders a black box of size 66x75 starting at (244, 3).
; PLAN: r0=266(x), r1=101(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=331(x1), r6=107(y1), r7=477(x2), r8=119(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=244(x), r11=3(y), r12=66(width), r13=75(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 266
LDI r1, 101
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 331
LDI r6, 107
LDI r7, 477
LDI r8, 119
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 244
LDI r11, 3
LDI r12, 66
LDI r13, 75
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT

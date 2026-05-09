; DESCRIPTION: Composite: Places a white circle of radius 45 at center (85, 58) then Places a green 70x36 rectangle at position (156, 22) then Renders a black line between points (174, 200) and (461, 183).
; PLAN: r0=85(x), r1=58(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=156(x), r6=22(y), r7=70(width), r8=36(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=174(x1), r11=200(y1), r12=461(x2), r13=183(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 85
LDI r1, 58
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 156
LDI r6, 22
LDI r7, 70
LDI r8, 36
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 174
LDI r11, 200
LDI r12, 461
LDI r13, 183
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT

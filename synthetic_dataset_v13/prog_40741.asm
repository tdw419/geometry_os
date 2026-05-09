; DESCRIPTION: Composite: Places a black line segment connecting (29, 53) to (278, 158) then Places a yellow 58x55 rectangle at position (107, 197) then Renders a white disk with center (46, 110) and radius 34.
; PLAN: r0=29(x1), r1=53(y1), r2=278(x2), r3=158(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=107(x), r6=197(y), r7=58(width), r8=55(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=46(x), r11=110(y), r12=34(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 29
LDI r1, 53
LDI r2, 278
LDI r3, 158
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 107
LDI r6, 197
LDI r7, 58
LDI r8, 55
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 46
LDI r11, 110
LDI r12, 34
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT

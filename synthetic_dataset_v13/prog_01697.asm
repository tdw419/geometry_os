; DESCRIPTION: Composite: Places a green line segment connecting (440, 178) to (159, 29) then Creates a green rectangular region at (449, 171) spanning 16 by 30 pixels then Places a purple circle of radius 40 at center (298, 53).
; PLAN: r0=440(x1), r1=178(y1), r2=159(x2), r3=29(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=449(x), r6=171(y), r7=16(width), r8=30(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=298(x), r11=53(y), r12=40(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 440
LDI r1, 178
LDI r2, 159
LDI r3, 29
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 449
LDI r6, 171
LDI r7, 16
LDI r8, 30
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 298
LDI r11, 53
LDI r12, 40
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT

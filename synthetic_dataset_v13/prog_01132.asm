; DESCRIPTION: Composite: Creates a black circular shape at (329, 176) with radius 76 then Places a green 22x88 rectangle at position (472, 152) then Places a white line segment connecting (7, 0) to (216, 185).
; PLAN: r0=329(x), r1=176(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=472(x), r6=152(y), r7=22(width), r8=88(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=7(x1), r11=0(y1), r12=216(x2), r13=185(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 329
LDI r1, 176
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 472
LDI r6, 152
LDI r7, 22
LDI r8, 88
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 7
LDI r11, 0
LDI r12, 216
LDI r13, 185
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT

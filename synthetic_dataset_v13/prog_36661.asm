; DESCRIPTION: Composite: Places a black line segment connecting (339, 49) to (235, 18) then Creates a yellow circular shape at (165, 114) with radius 59 then Places a white 86x22 rectangle at position (355, 16).
; PLAN: r0=339(x1), r1=49(y1), r2=235(x2), r3=18(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=165(x), r6=114(y), r7=59(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=355(x), r11=16(y), r12=86(width), r13=22(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 339
LDI r1, 49
LDI r2, 235
LDI r3, 18
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 165
LDI r6, 114
LDI r7, 59
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 355
LDI r11, 16
LDI r12, 86
LDI r13, 22
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT

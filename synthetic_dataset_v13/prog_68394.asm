; DESCRIPTION: Composite: Renders a yellow disk with center (333, 218) and radius 14 then Places a blue line segment connecting (291, 68) to (466, 254) then Creates a white rectangular region at (331, 123) spanning 55 by 104 pixels.
; PLAN: r0=333(x), r1=218(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=291(x1), r6=68(y1), r7=466(x2), r8=254(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=331(x), r11=123(y), r12=55(width), r13=104(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 333
LDI r1, 218
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 291
LDI r6, 68
LDI r7, 466
LDI r8, 254
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 331
LDI r11, 123
LDI r12, 55
LDI r13, 104
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT

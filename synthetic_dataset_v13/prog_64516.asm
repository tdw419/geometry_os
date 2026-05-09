; DESCRIPTION: Composite: Creates a white circular shape at (254, 59) with radius 18 then Places a white 64x20 rectangle at position (426, 47) then Places a black line segment connecting (484, 153) to (344, 10).
; PLAN: r0=254(x), r1=59(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=426(x), r6=47(y), r7=64(width), r8=20(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=484(x1), r11=153(y1), r12=344(x2), r13=10(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 254
LDI r1, 59
LDI r2, 18
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 426
LDI r6, 47
LDI r7, 64
LDI r8, 20
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 484
LDI r11, 153
LDI r12, 344
LDI r13, 10
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT

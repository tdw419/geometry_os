; DESCRIPTION: Composite: Creates a black circular shape at (96, 92) with radius 66 then Places a yellow 113x16 rectangle at position (186, 80) then Places a yellow line segment connecting (192, 201) to (315, 239).
; PLAN: r0=96(x), r1=92(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=186(x), r6=80(y), r7=113(width), r8=16(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=192(x1), r11=201(y1), r12=315(x2), r13=239(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 96
LDI r1, 92
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 186
LDI r6, 80
LDI r7, 113
LDI r8, 16
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 192
LDI r11, 201
LDI r12, 315
LDI r13, 239
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT

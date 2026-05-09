; DESCRIPTION: Composite: Places a blue circle of radius 49 at center (409, 191) then Renders a white box of size 116x64 starting at (30, 161) then Places a yellow line segment connecting (36, 135) to (342, 223).
; PLAN: r0=409(x), r1=191(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=30(x), r6=161(y), r7=116(width), r8=64(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=36(x1), r11=135(y1), r12=342(x2), r13=223(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 409
LDI r1, 191
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 30
LDI r6, 161
LDI r7, 116
LDI r8, 64
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 36
LDI r11, 135
LDI r12, 342
LDI r13, 223
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT

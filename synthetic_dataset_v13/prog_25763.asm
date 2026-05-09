; DESCRIPTION: Composite: Places a white circle of radius 33 at center (134, 83) then Places a cyan line segment connecting (193, 102) to (376, 219) then Places a purple 14x64 rectangle at position (390, 102).
; PLAN: r0=134(x), r1=83(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=193(x1), r6=102(y1), r7=376(x2), r8=219(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=390(x), r11=102(y), r12=14(width), r13=64(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 134
LDI r1, 83
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 193
LDI r6, 102
LDI r7, 376
LDI r8, 219
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 390
LDI r11, 102
LDI r12, 14
LDI r13, 64
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT

; DESCRIPTION: Composite: Places a white circle of radius 80 at center (179, 170) then Places a blue dot at position (476, 10) then Places a black 70x87 rectangle at position (229, 52).
; PLAN: r0=179(x), r1=170(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=476(x), r6=10(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=229(x), r11=52(y), r12=70(width), r13=87(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 179
LDI r1, 170
LDI r2, 80
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 476
LDI r6, 10
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 229
LDI r11, 52
LDI r12, 70
LDI r13, 87
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT

; DESCRIPTION: Composite: Places a black 83x88 rectangle at position (142, 3) then Places a purple line segment connecting (421, 191) to (379, 62) then Places a white dot at position (349, 180).
; PLAN: r0=142(x), r1=3(y), r2=83(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=421(x1), r6=191(y1), r7=379(x2), r8=62(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=349(x), r11=180(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 142
LDI r1, 3
LDI r2, 83
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 421
LDI r6, 191
LDI r7, 379
LDI r8, 62
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 349
LDI r11, 180
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT

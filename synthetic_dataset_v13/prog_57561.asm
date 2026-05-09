; DESCRIPTION: Composite: Places a white 58x88 rectangle at position (274, 68) then Places a purple line segment connecting (239, 51) to (128, 0) then Places a blue dot at position (227, 137).
; PLAN: r0=274(x), r1=68(y), r2=58(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=239(x1), r6=51(y1), r7=128(x2), r8=0(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=227(x), r11=137(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 274
LDI r1, 68
LDI r2, 58
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 239
LDI r6, 51
LDI r7, 128
LDI r8, 0
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 227
LDI r11, 137
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT

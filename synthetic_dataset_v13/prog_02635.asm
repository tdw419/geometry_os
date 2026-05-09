; DESCRIPTION: Composite: Places a black line segment connecting (453, 255) to (280, 56) then Renders a orange box of size 11x22 starting at (126, 61) then Places a white circle of radius 62 at center (143, 193).
; PLAN: r0=453(x1), r1=255(y1), r2=280(x2), r3=56(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=126(x), r6=61(y), r7=11(width), r8=22(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=143(x), r11=193(y), r12=62(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 453
LDI r1, 255
LDI r2, 280
LDI r3, 56
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 61
LDI r7, 11
LDI r8, 22
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 143
LDI r11, 193
LDI r12, 62
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT

; DESCRIPTION: Composite: Draws a cyan circle centered at (78, 164) with radius 64 then Places a white line segment connecting (320, 203) to (165, 87) then Places a black 76x10 rectangle at position (97, 129).
; PLAN: r0=78(x), r1=164(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=320(x1), r6=203(y1), r7=165(x2), r8=87(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=97(x), r11=129(y), r12=76(width), r13=10(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 78
LDI r1, 164
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 320
LDI r6, 203
LDI r7, 165
LDI r8, 87
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 97
LDI r11, 129
LDI r12, 76
LDI r13, 10
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT

; DESCRIPTION: Composite: Creates a orange circular shape at (348, 96) with radius 40 then Places a white 99x32 rectangle at position (37, 80) then Renders a black line between points (426, 252) and (318, 154).
; PLAN: r0=348(x), r1=96(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=37(x), r6=80(y), r7=99(width), r8=32(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=426(x1), r11=252(y1), r12=318(x2), r13=154(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 348
LDI r1, 96
LDI r2, 40
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 37
LDI r6, 80
LDI r7, 99
LDI r8, 32
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 426
LDI r11, 252
LDI r12, 318
LDI r13, 154
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT

; DESCRIPTION: Composite: Places a blue 19x21 rectangle at position (328, 193) then Renders a yellow line between points (332, 60) and (287, 143) then Creates a white circular shape at (450, 105) with radius 19.
; PLAN: r0=328(x), r1=193(y), r2=19(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=332(x1), r6=60(y1), r7=287(x2), r8=143(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=450(x), r11=105(y), r12=19(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 328
LDI r1, 193
LDI r2, 19
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 60
LDI r7, 287
LDI r8, 143
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 450
LDI r11, 105
LDI r12, 19
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT

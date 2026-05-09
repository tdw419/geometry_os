; DESCRIPTION: Composite: Places a orange 87x114 rectangle at position (24, 5) then Renders a black line between points (245, 249) and (76, 58) then Creates a magenta circular shape at (228, 157) with radius 73.
; PLAN: r0=24(x), r1=5(y), r2=87(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=245(x1), r6=249(y1), r7=76(x2), r8=58(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=228(x), r11=157(y), r12=73(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 24
LDI r1, 5
LDI r2, 87
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 249
LDI r7, 76
LDI r8, 58
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 228
LDI r11, 157
LDI r12, 73
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT

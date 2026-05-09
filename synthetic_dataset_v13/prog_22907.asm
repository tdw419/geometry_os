; DESCRIPTION: Composite: Places a green 63x82 rectangle at position (23, 122) then Creates a black circular shape at (366, 50) with radius 46 then Renders a magenta line between points (379, 117) and (253, 246).
; PLAN: r0=23(x), r1=122(y), r2=63(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=366(x), r6=50(y), r7=46(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=379(x1), r11=117(y1), r12=253(x2), r13=246(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 23
LDI r1, 122
LDI r2, 63
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 366
LDI r6, 50
LDI r7, 46
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 379
LDI r11, 117
LDI r12, 253
LDI r13, 246
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT

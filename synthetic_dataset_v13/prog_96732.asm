; DESCRIPTION: Composite: Places a yellow line segment connecting (281, 56) to (240, 235) then Places a green 54x67 rectangle at position (397, 176) then Creates a magenta circular shape at (452, 144) with radius 57.
; PLAN: r0=281(x1), r1=56(y1), r2=240(x2), r3=235(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=397(x), r6=176(y), r7=54(width), r8=67(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=452(x), r11=144(y), r12=57(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 281
LDI r1, 56
LDI r2, 240
LDI r3, 235
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 397
LDI r6, 176
LDI r7, 54
LDI r8, 67
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 452
LDI r11, 144
LDI r12, 57
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT

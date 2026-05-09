; DESCRIPTION: Composite: Creates a magenta rectangular region at (402, 150) spanning 81 by 70 pixels then Places a magenta circle of radius 10 at center (176, 89) then Places a cyan line segment connecting (471, 172) to (505, 44).
; PLAN: r0=402(x), r1=150(y), r2=81(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=176(x), r6=89(y), r7=10(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=471(x1), r11=172(y1), r12=505(x2), r13=44(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 402
LDI r1, 150
LDI r2, 81
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 89
LDI r7, 10
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 471
LDI r11, 172
LDI r12, 505
LDI r13, 44
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT

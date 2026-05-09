; DESCRIPTION: Composite: Places a black line segment connecting (199, 179) to (181, 143) then Places a yellow 77x29 rectangle at position (60, 32) then Places a magenta circle of radius 40 at center (406, 178).
; PLAN: r0=199(x1), r1=179(y1), r2=181(x2), r3=143(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=60(x), r6=32(y), r7=77(width), r8=29(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=406(x), r11=178(y), r12=40(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 199
LDI r1, 179
LDI r2, 181
LDI r3, 143
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 32
LDI r7, 77
LDI r8, 29
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 406
LDI r11, 178
LDI r12, 40
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT

; DESCRIPTION: Composite: Creates a black rectangular region at (16, 124) spanning 49 by 63 pixels then Draws a magenta circle centered at (456, 188) with radius 31 then Draws a green line from (498, 86) to (1, 188).
; PLAN: r0=16(x), r1=124(y), r2=49(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=456(x), r6=188(y), r7=31(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=498(x1), r11=86(y1), r12=1(x2), r13=188(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 16
LDI r1, 124
LDI r2, 49
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 456
LDI r6, 188
LDI r7, 31
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 498
LDI r11, 86
LDI r12, 1
LDI r13, 188
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT

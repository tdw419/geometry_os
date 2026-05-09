; DESCRIPTION: Composite: Places a purple line segment connecting (359, 85) to (119, 80) then Renders a black box of size 79x64 starting at (332, 63) then Places a magenta circle of radius 18 at center (208, 120).
; PLAN: r0=359(x1), r1=85(y1), r2=119(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=332(x), r6=63(y), r7=79(width), r8=64(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=208(x), r11=120(y), r12=18(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 359
LDI r1, 85
LDI r2, 119
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 63
LDI r7, 79
LDI r8, 64
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 208
LDI r11, 120
LDI r12, 18
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT

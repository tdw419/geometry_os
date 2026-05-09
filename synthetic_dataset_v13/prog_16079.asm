; DESCRIPTION: Composite: Places a yellow line segment connecting (464, 35) to (450, 179) then Renders a magenta box of size 81x69 starting at (249, 42) then Draws a black circle centered at (365, 140) with radius 34.
; PLAN: r0=464(x1), r1=35(y1), r2=450(x2), r3=179(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=249(x), r6=42(y), r7=81(width), r8=69(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=365(x), r11=140(y), r12=34(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 464
LDI r1, 35
LDI r2, 450
LDI r3, 179
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 249
LDI r6, 42
LDI r7, 81
LDI r8, 69
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 365
LDI r11, 140
LDI r12, 34
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT

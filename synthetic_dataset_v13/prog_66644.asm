; DESCRIPTION: Composite: Renders a red line between points (177, 79) and (108, 64) then Creates a magenta rectangular region at (27, 108) spanning 93 by 22 pixels then Draws a magenta circle centered at (282, 158) with radius 45.
; PLAN: r0=177(x1), r1=79(y1), r2=108(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=27(x), r6=108(y), r7=93(width), r8=22(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=282(x), r11=158(y), r12=45(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 177
LDI r1, 79
LDI r2, 108
LDI r3, 64
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 27
LDI r6, 108
LDI r7, 93
LDI r8, 22
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 282
LDI r11, 158
LDI r12, 45
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT

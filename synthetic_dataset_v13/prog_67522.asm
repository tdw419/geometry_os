; DESCRIPTION: Composite: Renders a yellow line between points (343, 168) and (24, 180) then Places a magenta circle of radius 77 at center (235, 89) then Creates a green rectangular region at (239, 188) spanning 10 by 58 pixels.
; PLAN: r0=343(x1), r1=168(y1), r2=24(x2), r3=180(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=235(x), r6=89(y), r7=77(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=239(x), r11=188(y), r12=10(width), r13=58(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 343
LDI r1, 168
LDI r2, 24
LDI r3, 180
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 89
LDI r7, 77
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 239
LDI r11, 188
LDI r12, 10
LDI r13, 58
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT

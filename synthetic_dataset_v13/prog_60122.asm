; DESCRIPTION: Composite: Draws a magenta circle centered at (293, 169) with radius 71 then Creates a green rectangular region at (148, 64) spanning 64 by 32 pixels then Draws a orange line from (460, 30) to (478, 85).
; PLAN: r0=293(x), r1=169(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=148(x), r6=64(y), r7=64(width), r8=32(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=460(x1), r11=30(y1), r12=478(x2), r13=85(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 293
LDI r1, 169
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 148
LDI r6, 64
LDI r7, 64
LDI r8, 32
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 460
LDI r11, 30
LDI r12, 478
LDI r13, 85
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT

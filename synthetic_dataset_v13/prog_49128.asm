; DESCRIPTION: Composite: Renders a yellow line between points (136, 71) and (372, 64) then Creates a orange rectangular region at (335, 57) spanning 61 by 29 pixels then Draws a magenta circle centered at (166, 140) with radius 78.
; PLAN: r0=136(x1), r1=71(y1), r2=372(x2), r3=64(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=335(x), r6=57(y), r7=61(width), r8=29(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=166(x), r11=140(y), r12=78(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 136
LDI r1, 71
LDI r2, 372
LDI r3, 64
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 335
LDI r6, 57
LDI r7, 61
LDI r8, 29
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 166
LDI r11, 140
LDI r12, 78
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT

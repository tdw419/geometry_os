; DESCRIPTION: Composite: Renders a magenta line between points (406, 168) and (108, 199) then Creates a orange rectangular region at (194, 86) spanning 64 by 105 pixels then Renders a yellow disk with center (65, 169) and radius 29.
; PLAN: r0=406(x1), r1=168(y1), r2=108(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=194(x), r6=86(y), r7=64(width), r8=105(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=65(x), r11=169(y), r12=29(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 406
LDI r1, 168
LDI r2, 108
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 86
LDI r7, 64
LDI r8, 105
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 65
LDI r11, 169
LDI r12, 29
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT

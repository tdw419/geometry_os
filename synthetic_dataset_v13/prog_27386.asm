; DESCRIPTION: Composite: Places a green 106x63 rectangle at position (357, 183) then Renders a blue disk with center (141, 60) and radius 44 then Renders a yellow line between points (312, 199) and (42, 184).
; PLAN: r0=357(x), r1=183(y), r2=106(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=141(x), r6=60(y), r7=44(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=312(x1), r11=199(y1), r12=42(x2), r13=184(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 357
LDI r1, 183
LDI r2, 106
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 60
LDI r7, 44
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 312
LDI r11, 199
LDI r12, 42
LDI r13, 184
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT

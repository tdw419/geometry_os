; DESCRIPTION: Composite: Renders a black line between points (83, 94) and (141, 211) then Renders a green disk with center (110, 151) and radius 20 then Creates a magenta rectangular region at (57, 102) spanning 63 by 111 pixels.
; PLAN: r0=83(x1), r1=94(y1), r2=141(x2), r3=211(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=110(x), r6=151(y), r7=20(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=57(x), r11=102(y), r12=63(width), r13=111(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 83
LDI r1, 94
LDI r2, 141
LDI r3, 211
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 110
LDI r6, 151
LDI r7, 20
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 57
LDI r11, 102
LDI r12, 63
LDI r13, 111
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT

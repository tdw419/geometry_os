; DESCRIPTION: Composite: Creates a yellow rectangular region at (113, 94) spanning 113 by 48 pixels then Renders a purple line between points (274, 204) and (393, 9) then Renders a black disk with center (145, 111) and radius 44.
; PLAN: r0=113(x), r1=94(y), r2=113(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=274(x1), r6=204(y1), r7=393(x2), r8=9(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=145(x), r11=111(y), r12=44(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 113
LDI r1, 94
LDI r2, 113
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 274
LDI r6, 204
LDI r7, 393
LDI r8, 9
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 145
LDI r11, 111
LDI r12, 44
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT

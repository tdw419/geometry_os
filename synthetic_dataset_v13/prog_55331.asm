; DESCRIPTION: Composite: Sets a single black pixel at (369, 158) then Creates a green circular shape at (102, 135) with radius 60 then Renders a purple line between points (471, 168) and (306, 158).
; PLAN: r0=369(x), r1=158(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=102(x), r6=135(y), r7=60(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=471(x1), r11=168(y1), r12=306(x2), r13=158(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 369
LDI r1, 158
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 102
LDI r6, 135
LDI r7, 60
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 471
LDI r11, 168
LDI r12, 306
LDI r13, 158
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT

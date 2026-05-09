; DESCRIPTION: Composite: Places a blue dot at position (21, 188) then Creates a magenta circular shape at (303, 102) with radius 19 then Draws a purple line from (237, 123) to (457, 148).
; PLAN: r0=21(x), r1=188(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=303(x), r6=102(y), r7=19(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=237(x1), r11=123(y1), r12=457(x2), r13=148(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 21
LDI r1, 188
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 303
LDI r6, 102
LDI r7, 19
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 237
LDI r11, 123
LDI r12, 457
LDI r13, 148
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT

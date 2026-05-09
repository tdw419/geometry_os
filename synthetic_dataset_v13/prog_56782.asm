; DESCRIPTION: Composite: Sets a single green pixel at (78, 108) then Creates a purple circular shape at (148, 67) with radius 48 then Draws a blue line from (388, 9) to (181, 123).
; PLAN: r0=78(x), r1=108(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=148(x), r6=67(y), r7=48(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=388(x1), r11=9(y1), r12=181(x2), r13=123(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 78
LDI r1, 108
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 148
LDI r6, 67
LDI r7, 48
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 388
LDI r11, 9
LDI r12, 181
LDI r13, 123
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT

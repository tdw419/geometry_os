; DESCRIPTION: Composite: Renders a blue line between points (181, 3) and (124, 130) then Sets a single white pixel at (180, 13) then Creates a blue rectangular region at (99, 0) spanning 21 by 78 pixels.
; PLAN: r0=181(x1), r1=3(y1), r2=124(x2), r3=130(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=180(x), r6=13(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=99(x), r11=0(y), r12=21(width), r13=78(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 181
LDI r1, 3
LDI r2, 124
LDI r3, 130
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 180
LDI r6, 13
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 99
LDI r11, 0
LDI r12, 21
LDI r13, 78
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT

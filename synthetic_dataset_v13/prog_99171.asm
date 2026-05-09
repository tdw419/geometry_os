; DESCRIPTION: Composite: Sets a single black pixel at (360, 64) then Renders a yellow disk with center (399, 105) and radius 78 then Draws a magenta line from (55, 181) to (406, 29).
; PLAN: r0=360(x), r1=64(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=399(x), r6=105(y), r7=78(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=55(x1), r11=181(y1), r12=406(x2), r13=29(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 360
LDI r1, 64
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 399
LDI r6, 105
LDI r7, 78
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 55
LDI r11, 181
LDI r12, 406
LDI r13, 29
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT

; DESCRIPTION: Composite: Places a blue dot at position (355, 111) then Renders a black disk with center (355, 163) and radius 43 then Draws a purple line from (138, 171) to (264, 136).
; PLAN: r0=355(x), r1=111(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=355(x), r6=163(y), r7=43(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=138(x1), r11=171(y1), r12=264(x2), r13=136(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 355
LDI r1, 111
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 355
LDI r6, 163
LDI r7, 43
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 138
LDI r11, 171
LDI r12, 264
LDI r13, 136
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT

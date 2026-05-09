; DESCRIPTION: Composite: Places a blue dot at position (421, 136) then Draws a magenta circle centered at (120, 110) with radius 68 then Renders a magenta line between points (441, 29) and (221, 194).
; PLAN: r0=421(x), r1=136(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=120(x), r6=110(y), r7=68(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=441(x1), r11=29(y1), r12=221(x2), r13=194(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 421
LDI r1, 136
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 120
LDI r6, 110
LDI r7, 68
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 441
LDI r11, 29
LDI r12, 221
LDI r13, 194
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT

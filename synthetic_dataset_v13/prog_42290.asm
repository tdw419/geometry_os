; DESCRIPTION: Composite: Places a black circle of radius 33 at center (369, 221) then Places a blue dot at position (377, 113) then Draws a black line from (155, 208) to (92, 136).
; PLAN: r0=369(x), r1=221(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=377(x), r6=113(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=155(x1), r11=208(y1), r12=92(x2), r13=136(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 369
LDI r1, 221
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 377
LDI r6, 113
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 155
LDI r11, 208
LDI r12, 92
LDI r13, 136
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT

; DESCRIPTION: Composite: Renders a purple line between points (421, 206) and (225, 227) then Places a purple 120x112 rectangle at position (208, 142) then Draws a red circle centered at (227, 92) with radius 71.
; PLAN: r0=421(x1), r1=206(y1), r2=225(x2), r3=227(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=208(x), r6=142(y), r7=120(width), r8=112(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=227(x), r11=92(y), r12=71(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 421
LDI r1, 206
LDI r2, 225
LDI r3, 227
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 142
LDI r7, 120
LDI r8, 112
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 227
LDI r11, 92
LDI r12, 71
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT

; DESCRIPTION: Composite: Places a purple 69x29 rectangle at position (155, 144) then Renders a purple disk with center (341, 177) and radius 51.
; PLAN: r0=155(x), r1=144(y), r2=69(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=341(x), r6=177(y), r7=51(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 155
LDI r1, 144
LDI r2, 69
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 341
LDI r6, 177
LDI r7, 51
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT

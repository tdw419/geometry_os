; DESCRIPTION: Composite: Sets a single black pixel at (139, 181) then Places a red circle of radius 59 at center (216, 114) then Renders a blue line between points (452, 128) and (418, 204).
; PLAN: r0=139(x), r1=181(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=216(x), r6=114(y), r7=59(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=452(x1), r11=128(y1), r12=418(x2), r13=204(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 139
LDI r1, 181
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 216
LDI r6, 114
LDI r7, 59
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 452
LDI r11, 128
LDI r12, 418
LDI r13, 204
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT

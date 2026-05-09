; DESCRIPTION: Composite: Places a magenta dot at position (58, 4) then Places a purple circle of radius 22 at center (155, 74) then Renders a magenta line between points (238, 21) and (37, 158).
; PLAN: r0=58(x), r1=4(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=155(x), r6=74(y), r7=22(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=238(x1), r11=21(y1), r12=37(x2), r13=158(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 58
LDI r1, 4
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 155
LDI r6, 74
LDI r7, 22
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 238
LDI r11, 21
LDI r12, 37
LDI r13, 158
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT

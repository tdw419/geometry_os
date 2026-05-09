; DESCRIPTION: Composite: Creates a blue circular shape at (262, 157) with radius 52 then Sets a single magenta pixel at (457, 212) then Renders a purple line between points (452, 212) and (81, 76).
; PLAN: r0=262(x), r1=157(y), r2=52(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=457(x), r6=212(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=452(x1), r11=212(y1), r12=81(x2), r13=76(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 262
LDI r1, 157
LDI r2, 52
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 457
LDI r6, 212
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 452
LDI r11, 212
LDI r12, 81
LDI r13, 76
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT

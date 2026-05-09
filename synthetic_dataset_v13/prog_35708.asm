; DESCRIPTION: Composite: Draws a purple circle centered at (345, 109) with radius 68 then Sets a single magenta pixel at (57, 148) then Renders a blue line between points (456, 196) and (228, 101).
; PLAN: r0=345(x), r1=109(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=57(x), r6=148(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=456(x1), r11=196(y1), r12=228(x2), r13=101(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 345
LDI r1, 109
LDI r2, 68
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 57
LDI r6, 148
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 456
LDI r11, 196
LDI r12, 228
LDI r13, 101
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT

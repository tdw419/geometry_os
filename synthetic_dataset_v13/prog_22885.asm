; DESCRIPTION: Composite: Creates a black circular shape at (124, 148) with radius 32 then Draws a purple line from (107, 138) to (342, 74).
; PLAN: r0=124(x), r1=148(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=107(x1), r6=138(y1), r7=342(x2), r8=74(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 124
LDI r1, 148
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 107
LDI r6, 138
LDI r7, 342
LDI r8, 74
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT

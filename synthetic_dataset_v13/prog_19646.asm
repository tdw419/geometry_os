; DESCRIPTION: Composite: Places a magenta dot at position (114, 11) then Renders a black disk with center (153, 150) and radius 62 then Places a blue line segment connecting (307, 201) to (167, 245).
; PLAN: r0=114(x), r1=11(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=153(x), r6=150(y), r7=62(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=307(x1), r11=201(y1), r12=167(x2), r13=245(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 114
LDI r1, 11
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 153
LDI r6, 150
LDI r7, 62
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 307
LDI r11, 201
LDI r12, 167
LDI r13, 245
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT

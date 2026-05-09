; DESCRIPTION: Composite: Places a magenta dot at position (396, 157) then Renders a blue line between points (358, 114) and (474, 209) then Creates a magenta circular shape at (49, 177) with radius 33.
; PLAN: r0=396(x), r1=157(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=358(x1), r6=114(y1), r7=474(x2), r8=209(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=49(x), r11=177(y), r12=33(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 396
LDI r1, 157
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 358
LDI r6, 114
LDI r7, 474
LDI r8, 209
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 49
LDI r11, 177
LDI r12, 33
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT

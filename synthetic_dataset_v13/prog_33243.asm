; DESCRIPTION: Composite: Draws a black line from (121, 166) to (74, 130) then Sets a single white pixel at (33, 247) then Creates a magenta circular shape at (235, 157) with radius 37.
; PLAN: r0=121(x1), r1=166(y1), r2=74(x2), r3=130(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=33(x), r6=247(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=235(x), r11=157(y), r12=37(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 121
LDI r1, 166
LDI r2, 74
LDI r3, 130
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 33
LDI r6, 247
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 235
LDI r11, 157
LDI r12, 37
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT

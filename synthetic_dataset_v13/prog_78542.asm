; DESCRIPTION: Composite: Sets a single white pixel at (358, 49) then Renders a blue line between points (263, 226) and (267, 48) then Creates a yellow circular shape at (297, 164) with radius 73.
; PLAN: r0=358(x), r1=49(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=263(x1), r6=226(y1), r7=267(x2), r8=48(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=297(x), r11=164(y), r12=73(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 358
LDI r1, 49
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 263
LDI r6, 226
LDI r7, 267
LDI r8, 48
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 297
LDI r11, 164
LDI r12, 73
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT

; DESCRIPTION: Composite: Places a green line segment connecting (332, 156) to (504, 139) then Draws a magenta circle centered at (388, 143) with radius 73 then Sets a single magenta pixel at (402, 171).
; PLAN: r0=332(x1), r1=156(y1), r2=504(x2), r3=139(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=388(x), r6=143(y), r7=73(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=402(x), r11=171(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 332
LDI r1, 156
LDI r2, 504
LDI r3, 139
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 143
LDI r7, 73
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 402
LDI r11, 171
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT

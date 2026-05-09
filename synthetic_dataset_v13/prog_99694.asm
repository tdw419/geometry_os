; DESCRIPTION: Composite: Creates a blue rectangular region at (18, 132) spanning 80 by 73 pixels then Places a green circle of radius 49 at center (237, 87) then Sets a single blue pixel at (476, 37).
; PLAN: r0=18(x), r1=132(y), r2=80(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=237(x), r6=87(y), r7=49(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=476(x), r11=37(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 18
LDI r1, 132
LDI r2, 80
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 87
LDI r7, 49
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 476
LDI r11, 37
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT

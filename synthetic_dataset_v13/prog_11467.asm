; DESCRIPTION: Composite: Places a black line segment connecting (392, 216) to (388, 208) then Draws a blue circle centered at (218, 73) with radius 72 then Sets a single purple pixel at (396, 66).
; PLAN: r0=392(x1), r1=216(y1), r2=388(x2), r3=208(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=218(x), r6=73(y), r7=72(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=396(x), r11=66(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 392
LDI r1, 216
LDI r2, 388
LDI r3, 208
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 73
LDI r7, 72
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 396
LDI r11, 66
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT

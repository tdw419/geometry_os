; DESCRIPTION: Composite: Draws a magenta line from (255, 163) to (481, 218) then Creates a blue circular shape at (280, 145) with radius 69 then Sets a single yellow pixel at (346, 31).
; PLAN: r0=255(x1), r1=163(y1), r2=481(x2), r3=218(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=280(x), r6=145(y), r7=69(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=346(x), r11=31(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 255
LDI r1, 163
LDI r2, 481
LDI r3, 218
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 145
LDI r7, 69
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 346
LDI r11, 31
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT

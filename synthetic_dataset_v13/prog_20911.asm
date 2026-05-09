; DESCRIPTION: Composite: Creates a yellow rectangular region at (377, 5) spanning 63 by 35 pixels then Draws a blue circle centered at (106, 185) with radius 70 then Sets a single yellow pixel at (218, 195).
; PLAN: r0=377(x), r1=5(y), r2=63(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=106(x), r6=185(y), r7=70(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=218(x), r11=195(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 377
LDI r1, 5
LDI r2, 63
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 185
LDI r7, 70
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 218
LDI r11, 195
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT

; DESCRIPTION: Composite: Creates a green rectangular region at (69, 35) spanning 20 by 114 pixels then Draws a purple circle centered at (311, 194) with radius 33 then Sets a single red pixel at (27, 51).
; PLAN: r0=69(x), r1=35(y), r2=20(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=311(x), r6=194(y), r7=33(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=27(x), r11=51(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 69
LDI r1, 35
LDI r2, 20
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 311
LDI r6, 194
LDI r7, 33
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 27
LDI r11, 51
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT

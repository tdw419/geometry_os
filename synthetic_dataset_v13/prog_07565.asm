; DESCRIPTION: Composite: Creates a magenta rectangular region at (324, 5) spanning 37 by 95 pixels then Sets a single red pixel at (440, 63) then Draws a white circle centered at (234, 163) with radius 70.
; PLAN: r0=324(x), r1=5(y), r2=37(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=440(x), r6=63(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=234(x), r11=163(y), r12=70(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 324
LDI r1, 5
LDI r2, 37
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 440
LDI r6, 63
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 234
LDI r11, 163
LDI r12, 70
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT

; DESCRIPTION: Composite: Draws a blue circle centered at (245, 69) with radius 45 then Creates a red rectangular region at (226, 92) spanning 50 by 50 pixels then Sets a single red pixel at (357, 143).
; PLAN: r0=245(x), r1=69(y), r2=45(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=226(x), r6=92(y), r7=50(width), r8=50(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=357(x), r11=143(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 245
LDI r1, 69
LDI r2, 45
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 226
LDI r6, 92
LDI r7, 50
LDI r8, 50
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 357
LDI r11, 143
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT

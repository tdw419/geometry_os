; DESCRIPTION: Composite: Creates a blue rectangular region at (234, 59) spanning 75 by 85 pixels then Sets a single magenta pixel at (275, 251).
; PLAN: r0=234(x), r1=59(y), r2=75(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=275(x), r6=251(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 234
LDI r1, 59
LDI r2, 75
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 251
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT

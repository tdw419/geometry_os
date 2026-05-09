; DESCRIPTION: Composite: Creates a magenta rectangular region at (86, 78) spanning 70 by 60 pixels then Sets a single red pixel at (491, 7).
; PLAN: r0=86(x), r1=78(y), r2=70(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=491(x), r6=7(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 86
LDI r1, 78
LDI r2, 70
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 491
LDI r6, 7
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT

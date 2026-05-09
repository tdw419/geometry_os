; DESCRIPTION: Composite: Draws a magenta rectangle at (335, 109) with width 114 and height 69 then Sets a single red pixel at (99, 61).
; PLAN: r0=335(x), r1=109(y), r2=114(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=99(x), r6=61(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 335
LDI r1, 109
LDI r2, 114
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 99
LDI r6, 61
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT

; DESCRIPTION: Composite: Creates a purple rectangular region at (155, 220) spanning 68 by 23 pixels then Sets a single red pixel at (184, 32).
; PLAN: r0=155(x), r1=220(y), r2=68(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=184(x), r6=32(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 155
LDI r1, 220
LDI r2, 68
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 32
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT

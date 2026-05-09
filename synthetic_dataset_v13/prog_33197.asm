; DESCRIPTION: Composite: Creates a white rectangular region at (220, 105) spanning 12 by 106 pixels then Sets a single red pixel at (252, 224).
; PLAN: r0=220(x), r1=105(y), r2=12(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=252(x), r6=224(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 220
LDI r1, 105
LDI r2, 12
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 252
LDI r6, 224
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT

; DESCRIPTION: Composite: Creates a orange rectangular region at (251, 29) spanning 50 by 105 pixels then Sets a single cyan pixel at (133, 141).
; PLAN: r0=251(x), r1=29(y), r2=50(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=133(x), r6=141(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 251
LDI r1, 29
LDI r2, 50
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 133
LDI r6, 141
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT

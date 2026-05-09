; DESCRIPTION: Composite: Creates a blue rectangular region at (30, 21) spanning 98 by 43 pixels then Sets a single cyan pixel at (93, 97).
; PLAN: r0=30(x), r1=21(y), r2=98(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=93(x), r6=97(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 30
LDI r1, 21
LDI r2, 98
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 97
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT

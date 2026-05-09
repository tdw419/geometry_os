; DESCRIPTION: Composite: Creates a blue rectangular region at (360, 139) spanning 27 by 97 pixels then Sets a single cyan pixel at (467, 32).
; PLAN: r0=360(x), r1=139(y), r2=27(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=467(x), r6=32(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 360
LDI r1, 139
LDI r2, 27
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 32
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT

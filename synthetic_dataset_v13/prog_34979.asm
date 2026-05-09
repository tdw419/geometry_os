; DESCRIPTION: Composite: Creates a cyan rectangular region at (270, 23) spanning 94 by 16 pixels then Sets a single white pixel at (439, 93).
; PLAN: r0=270(x), r1=23(y), r2=94(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=439(x), r6=93(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 270
LDI r1, 23
LDI r2, 94
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 93
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT

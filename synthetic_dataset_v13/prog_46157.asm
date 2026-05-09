; DESCRIPTION: Composite: Creates a red rectangular region at (348, 93) spanning 20 by 120 pixels then Sets a single green pixel at (359, 179).
; PLAN: r0=348(x), r1=93(y), r2=20(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=359(x), r6=179(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 348
LDI r1, 93
LDI r2, 20
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 359
LDI r6, 179
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT

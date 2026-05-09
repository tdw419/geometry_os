; DESCRIPTION: Creates a magenta rectangular region at (348, 93) spanning 78 by 15 pixels.
; PLAN: r0=348(x), r1=93(y), r2=78(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 93
LDI r2, 78
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a magenta rectangular region at (339, 106) spanning 115 by 93 pixels.
; PLAN: r0=339(x), r1=106(y), r2=115(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 106
LDI r2, 115
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

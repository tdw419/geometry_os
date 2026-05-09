; DESCRIPTION: Creates a red rectangular region at (309, 156) spanning 19 by 81 pixels.
; PLAN: r0=309(x), r1=156(y), r2=19(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 156
LDI r2, 19
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a red rectangular region at (266, 157) spanning 89 by 81 pixels.
; PLAN: r0=266(x), r1=157(y), r2=89(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 157
LDI r2, 89
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

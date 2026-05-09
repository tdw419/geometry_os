; DESCRIPTION: Creates a red rectangular region at (134, 14) spanning 101 by 93 pixels.
; PLAN: r0=134(x), r1=14(y), r2=101(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 14
LDI r2, 101
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a red rectangular region at (74, 76) spanning 73 by 100 pixels.
; PLAN: r0=74(x), r1=76(y), r2=73(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 76
LDI r2, 73
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

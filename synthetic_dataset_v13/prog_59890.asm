; DESCRIPTION: Creates a red rectangular region at (49, 190) spanning 35 by 34 pixels.
; PLAN: r0=49(x), r1=190(y), r2=35(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 190
LDI r2, 35
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

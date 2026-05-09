; DESCRIPTION: Creates a red rectangular region at (458, 66) spanning 22 by 49 pixels.
; PLAN: r0=458(x), r1=66(y), r2=22(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 66
LDI r2, 22
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

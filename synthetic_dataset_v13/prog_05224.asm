; DESCRIPTION: Creates a red rectangular region at (34, 97) spanning 89 by 69 pixels.
; PLAN: r0=34(x), r1=97(y), r2=89(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 97
LDI r2, 89
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

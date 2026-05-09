; DESCRIPTION: Creates a red rectangular region at (227, 26) spanning 69 by 85 pixels.
; PLAN: r0=227(x), r1=26(y), r2=69(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 26
LDI r2, 69
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

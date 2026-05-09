; DESCRIPTION: Creates a red rectangular region at (381, 122) spanning 38 by 30 pixels.
; PLAN: r0=381(x), r1=122(y), r2=38(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 122
LDI r2, 38
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

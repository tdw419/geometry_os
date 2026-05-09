; DESCRIPTION: Creates a red rectangular region at (18, 122) spanning 81 by 90 pixels.
; PLAN: r0=18(x), r1=122(y), r2=81(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 122
LDI r2, 81
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

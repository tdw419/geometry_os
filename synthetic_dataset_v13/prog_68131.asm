; DESCRIPTION: Creates a red rectangular region at (81, 153) spanning 114 by 97 pixels.
; PLAN: r0=81(x), r1=153(y), r2=114(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 153
LDI r2, 114
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a red rectangular region at (355, 101) spanning 114 by 25 pixels.
; PLAN: r0=355(x), r1=101(y), r2=114(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 101
LDI r2, 114
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

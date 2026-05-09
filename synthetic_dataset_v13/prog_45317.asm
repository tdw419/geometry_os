; DESCRIPTION: Creates a red rectangular region at (53, 25) spanning 106 by 101 pixels.
; PLAN: r0=53(x), r1=25(y), r2=106(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 25
LDI r2, 106
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

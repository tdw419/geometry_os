; DESCRIPTION: Creates a red rectangular region at (24, 142) spanning 97 by 101 pixels.
; PLAN: r0=24(x), r1=142(y), r2=97(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 142
LDI r2, 97
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

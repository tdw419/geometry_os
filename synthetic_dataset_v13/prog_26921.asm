; DESCRIPTION: Creates a red rectangular region at (232, 97) spanning 100 by 58 pixels.
; PLAN: r0=232(x), r1=97(y), r2=100(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 97
LDI r2, 100
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

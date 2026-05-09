; DESCRIPTION: Creates a black rectangular region at (151, 102) spanning 24 by 34 pixels.
; PLAN: r0=151(x), r1=102(y), r2=24(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 102
LDI r2, 24
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

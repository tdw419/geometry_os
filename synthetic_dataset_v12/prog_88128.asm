; DESCRIPTION: Creates a black rectangular region at (14, 125) spanning 114 by 24 pixels.
; PLAN: r0=14(x), r1=125(y), r2=114(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 125
LDI r2, 114
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

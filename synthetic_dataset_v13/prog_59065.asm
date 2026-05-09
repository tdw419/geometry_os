; DESCRIPTION: Creates a black rectangular region at (49, 140) spanning 77 by 116 pixels.
; PLAN: r0=49(x), r1=140(y), r2=77(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 140
LDI r2, 77
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

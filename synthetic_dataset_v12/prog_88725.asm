; DESCRIPTION: Creates a white rectangular region at (2, 122) spanning 66 by 71 pixels.
; PLAN: r0=2(x), r1=122(y), r2=66(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 122
LDI r2, 66
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a white rectangular region at (119, 102) spanning 66 by 96 pixels.
; PLAN: r0=119(x), r1=102(y), r2=66(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 102
LDI r2, 66
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

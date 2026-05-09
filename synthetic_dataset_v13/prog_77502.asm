; DESCRIPTION: Creates a white rectangular region at (388, 136) spanning 19 by 114 pixels.
; PLAN: r0=388(x), r1=136(y), r2=19(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 136
LDI r2, 19
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

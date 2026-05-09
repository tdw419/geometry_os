; DESCRIPTION: Creates a white rectangular region at (115, 114) spanning 66 by 12 pixels.
; PLAN: r0=115(x), r1=114(y), r2=66(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 114
LDI r2, 66
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

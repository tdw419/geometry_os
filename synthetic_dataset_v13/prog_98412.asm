; DESCRIPTION: Creates a white rectangular region at (5, 132) spanning 114 by 40 pixels.
; PLAN: r0=5(x), r1=132(y), r2=114(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 132
LDI r2, 114
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

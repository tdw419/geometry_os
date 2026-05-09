; DESCRIPTION: Creates a white rectangular region at (49, 9) spanning 105 by 96 pixels.
; PLAN: r0=49(x), r1=9(y), r2=105(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 9
LDI r2, 105
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a white rectangular region at (209, 49) spanning 107 by 96 pixels.
; PLAN: r0=209(x), r1=49(y), r2=107(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 49
LDI r2, 107
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

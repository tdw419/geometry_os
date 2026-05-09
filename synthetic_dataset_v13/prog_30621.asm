; DESCRIPTION: Creates a white rectangular region at (8, 140) spanning 84 by 96 pixels.
; PLAN: r0=8(x), r1=140(y), r2=84(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 140
LDI r2, 84
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

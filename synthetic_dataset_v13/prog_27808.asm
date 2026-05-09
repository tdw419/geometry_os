; DESCRIPTION: Creates a white rectangular region at (132, 49) spanning 119 by 84 pixels.
; PLAN: r0=132(x), r1=49(y), r2=119(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 49
LDI r2, 119
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

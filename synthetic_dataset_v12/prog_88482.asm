; DESCRIPTION: Creates a white rectangular region at (155, 159) spanning 119 by 64 pixels.
; PLAN: r0=155(x), r1=159(y), r2=119(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 159
LDI r2, 119
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

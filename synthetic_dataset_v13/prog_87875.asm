; DESCRIPTION: Creates a black rectangular region at (125, 183) spanning 75 by 62 pixels.
; PLAN: r0=125(x), r1=183(y), r2=75(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 183
LDI r2, 75
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

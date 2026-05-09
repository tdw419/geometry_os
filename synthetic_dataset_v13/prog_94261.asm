; DESCRIPTION: Creates a white rectangular region at (183, 155) spanning 75 by 76 pixels.
; PLAN: r0=183(x), r1=155(y), r2=75(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 155
LDI r2, 75
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

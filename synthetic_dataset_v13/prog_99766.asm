; DESCRIPTION: Creates a white rectangular region at (111, 155) spanning 105 by 76 pixels.
; PLAN: r0=111(x), r1=155(y), r2=105(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 155
LDI r2, 105
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

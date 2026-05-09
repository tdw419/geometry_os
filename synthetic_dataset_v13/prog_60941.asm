; DESCRIPTION: Creates a white rectangular region at (314, 43) spanning 24 by 105 pixels.
; PLAN: r0=314(x), r1=43(y), r2=24(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 43
LDI r2, 24
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

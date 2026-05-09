; DESCRIPTION: Creates a white rectangular region at (338, 112) spanning 105 by 108 pixels.
; PLAN: r0=338(x), r1=112(y), r2=105(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 112
LDI r2, 105
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

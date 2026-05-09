; DESCRIPTION: Creates a white rectangular region at (151, 138) spanning 60 by 43 pixels.
; PLAN: r0=151(x), r1=138(y), r2=60(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 138
LDI r2, 60
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

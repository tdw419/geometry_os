; DESCRIPTION: Creates a white rectangular region at (353, 172) spanning 105 by 33 pixels.
; PLAN: r0=353(x), r1=172(y), r2=105(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 172
LDI r2, 105
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

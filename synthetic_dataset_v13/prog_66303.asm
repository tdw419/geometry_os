; DESCRIPTION: Creates a white rectangular region at (304, 119) spanning 107 by 112 pixels.
; PLAN: r0=304(x), r1=119(y), r2=107(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 119
LDI r2, 107
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

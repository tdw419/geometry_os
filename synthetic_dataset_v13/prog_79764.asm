; DESCRIPTION: Creates a white rectangular region at (204, 142) spanning 39 by 89 pixels.
; PLAN: r0=204(x), r1=142(y), r2=39(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 142
LDI r2, 39
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a white rectangular region at (227, 44) spanning 74 by 40 pixels.
; PLAN: r0=227(x), r1=44(y), r2=74(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 44
LDI r2, 74
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

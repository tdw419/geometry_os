; DESCRIPTION: Creates a white rectangular region at (227, 104) spanning 73 by 101 pixels.
; PLAN: r0=227(x), r1=104(y), r2=73(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 104
LDI r2, 73
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

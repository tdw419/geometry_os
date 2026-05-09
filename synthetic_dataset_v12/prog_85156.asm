; DESCRIPTION: Creates a white rectangular region at (361, 136) spanning 91 by 89 pixels.
; PLAN: r0=361(x), r1=136(y), r2=91(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 136
LDI r2, 91
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

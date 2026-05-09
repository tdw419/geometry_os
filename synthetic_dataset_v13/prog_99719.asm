; DESCRIPTION: Creates a white rectangular region at (407, 38) spanning 48 by 89 pixels.
; PLAN: r0=407(x), r1=38(y), r2=48(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 38
LDI r2, 48
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

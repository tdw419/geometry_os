; DESCRIPTION: Creates a white rectangular region at (199, 88) spanning 61 by 86 pixels.
; PLAN: r0=199(x), r1=88(y), r2=61(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 88
LDI r2, 61
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

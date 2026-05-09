; DESCRIPTION: Creates a white rectangular region at (89, 56) spanning 120 by 74 pixels.
; PLAN: r0=89(x), r1=56(y), r2=120(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 56
LDI r2, 120
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

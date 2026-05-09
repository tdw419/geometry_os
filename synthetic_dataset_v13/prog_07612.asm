; DESCRIPTION: Creates a white rectangular region at (89, 71) spanning 20 by 35 pixels.
; PLAN: r0=89(x), r1=71(y), r2=20(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 71
LDI r2, 20
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a white rectangular region at (200, 73) spanning 89 by 118 pixels.
; PLAN: r0=200(x), r1=73(y), r2=89(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 73
LDI r2, 89
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

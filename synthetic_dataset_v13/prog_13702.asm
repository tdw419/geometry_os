; DESCRIPTION: Creates a white rectangular region at (327, 158) spanning 24 by 89 pixels.
; PLAN: r0=327(x), r1=158(y), r2=24(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 158
LDI r2, 24
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

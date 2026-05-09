; DESCRIPTION: Creates a white rectangular region at (170, 158) spanning 44 by 89 pixels.
; PLAN: r0=170(x), r1=158(y), r2=44(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 158
LDI r2, 44
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

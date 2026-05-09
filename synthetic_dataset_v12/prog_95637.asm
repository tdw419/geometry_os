; DESCRIPTION: Creates a white rectangular region at (437, 123) spanning 49 by 74 pixels.
; PLAN: r0=437(x), r1=123(y), r2=49(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 123
LDI r2, 49
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

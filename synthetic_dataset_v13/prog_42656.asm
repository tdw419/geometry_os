; DESCRIPTION: Creates a white rectangular region at (437, 77) spanning 49 by 28 pixels.
; PLAN: r0=437(x), r1=77(y), r2=49(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 77
LDI r2, 49
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

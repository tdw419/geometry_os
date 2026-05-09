; DESCRIPTION: Creates a white rectangular region at (339, 52) spanning 98 by 80 pixels.
; PLAN: r0=339(x), r1=52(y), r2=98(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 52
LDI r2, 98
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

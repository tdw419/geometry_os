; DESCRIPTION: Creates a yellow rectangular region at (339, 158) spanning 74 by 38 pixels.
; PLAN: r0=339(x), r1=158(y), r2=74(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 158
LDI r2, 74
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

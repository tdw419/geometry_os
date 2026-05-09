; DESCRIPTION: Creates a yellow rectangular region at (334, 139) spanning 43 by 19 pixels.
; PLAN: r0=334(x), r1=139(y), r2=43(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 139
LDI r2, 43
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

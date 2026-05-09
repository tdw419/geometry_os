; DESCRIPTION: Creates a yellow rectangular region at (339, 12) spanning 76 by 47 pixels.
; PLAN: r0=339(x), r1=12(y), r2=76(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 12
LDI r2, 76
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

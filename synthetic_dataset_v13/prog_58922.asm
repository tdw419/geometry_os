; DESCRIPTION: Creates a yellow rectangular region at (353, 36) spanning 114 by 38 pixels.
; PLAN: r0=353(x), r1=36(y), r2=114(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 36
LDI r2, 114
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

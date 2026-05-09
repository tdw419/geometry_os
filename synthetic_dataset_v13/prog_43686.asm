; DESCRIPTION: Creates a yellow rectangular region at (58, 60) spanning 108 by 114 pixels.
; PLAN: r0=58(x), r1=60(y), r2=108(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 60
LDI r2, 108
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

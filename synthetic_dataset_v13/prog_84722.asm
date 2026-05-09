; DESCRIPTION: Creates a yellow rectangular region at (35, 151) spanning 88 by 102 pixels.
; PLAN: r0=35(x), r1=151(y), r2=88(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 151
LDI r2, 88
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

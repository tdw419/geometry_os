; DESCRIPTION: Creates a yellow rectangular region at (259, 153) spanning 102 by 88 pixels.
; PLAN: r0=259(x), r1=153(y), r2=102(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 153
LDI r2, 102
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

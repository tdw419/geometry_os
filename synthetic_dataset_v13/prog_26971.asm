; DESCRIPTION: Creates a yellow rectangular region at (234, 88) spanning 53 by 71 pixels.
; PLAN: r0=234(x), r1=88(y), r2=53(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 88
LDI r2, 53
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

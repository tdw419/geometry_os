; DESCRIPTION: Creates a yellow rectangular region at (4, 88) spanning 108 by 116 pixels.
; PLAN: r0=4(x), r1=88(y), r2=108(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 88
LDI r2, 108
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a yellow rectangular region at (108, 122) spanning 88 by 113 pixels.
; PLAN: r0=108(x), r1=122(y), r2=88(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 122
LDI r2, 88
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

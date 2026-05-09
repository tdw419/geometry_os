; DESCRIPTION: Creates a yellow rectangular region at (44, 122) spanning 21 by 108 pixels.
; PLAN: r0=44(x), r1=122(y), r2=21(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 122
LDI r2, 21
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

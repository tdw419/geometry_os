; DESCRIPTION: Creates a green rectangular region at (108, 122) spanning 106 by 49 pixels.
; PLAN: r0=108(x), r1=122(y), r2=106(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 122
LDI r2, 106
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

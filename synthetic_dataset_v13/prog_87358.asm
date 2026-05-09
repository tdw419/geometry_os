; DESCRIPTION: Creates a blue rectangular region at (28, 158) spanning 108 by 38 pixels.
; PLAN: r0=28(x), r1=158(y), r2=108(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 158
LDI r2, 108
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

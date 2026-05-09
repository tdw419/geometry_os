; DESCRIPTION: Creates a blue rectangular region at (337, 105) spanning 11 by 108 pixels.
; PLAN: r0=337(x), r1=105(y), r2=11(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 105
LDI r2, 11
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

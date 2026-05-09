; DESCRIPTION: Creates a blue rectangular region at (381, 118) spanning 108 by 78 pixels.
; PLAN: r0=381(x), r1=118(y), r2=108(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 118
LDI r2, 108
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

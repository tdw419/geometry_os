; DESCRIPTION: Creates a purple rectangular region at (155, 90) spanning 108 by 23 pixels.
; PLAN: r0=155(x), r1=90(y), r2=108(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 90
LDI r2, 108
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

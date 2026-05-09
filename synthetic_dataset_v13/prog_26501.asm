; DESCRIPTION: Creates a purple rectangular region at (359, 155) spanning 60 by 23 pixels.
; PLAN: r0=359(x), r1=155(y), r2=60(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 155
LDI r2, 60
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a blue rectangular region at (388, 33) spanning 108 by 53 pixels.
; PLAN: r0=388(x), r1=33(y), r2=108(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 33
LDI r2, 108
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

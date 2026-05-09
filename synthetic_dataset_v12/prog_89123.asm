; DESCRIPTION: Creates a blue rectangular region at (355, 194) spanning 53 by 23 pixels.
; PLAN: r0=355(x), r1=194(y), r2=53(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 194
LDI r2, 53
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a blue rectangular region at (355, 108) spanning 82 by 44 pixels.
; PLAN: r0=355(x), r1=108(y), r2=82(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 108
LDI r2, 82
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

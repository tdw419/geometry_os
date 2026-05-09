; DESCRIPTION: Creates a purple rectangular region at (389, 59) spanning 62 by 70 pixels.
; PLAN: r0=389(x), r1=59(y), r2=62(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 59
LDI r2, 62
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

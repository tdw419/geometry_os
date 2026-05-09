; DESCRIPTION: Creates a blue rectangular region at (289, 133) spanning 108 by 95 pixels.
; PLAN: r0=289(x), r1=133(y), r2=108(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 133
LDI r2, 108
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

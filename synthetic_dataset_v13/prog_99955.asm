; DESCRIPTION: Creates a blue rectangular region at (226, 133) spanning 55 by 53 pixels.
; PLAN: r0=226(x), r1=133(y), r2=55(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 133
LDI r2, 55
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

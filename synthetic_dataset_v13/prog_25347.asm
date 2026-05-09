; DESCRIPTION: Creates a purple rectangular region at (397, 108) spanning 47 by 82 pixels.
; PLAN: r0=397(x), r1=108(y), r2=47(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 108
LDI r2, 47
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

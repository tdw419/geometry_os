; DESCRIPTION: Creates a purple rectangular region at (244, 185) spanning 93 by 69 pixels.
; PLAN: r0=244(x), r1=185(y), r2=93(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 185
LDI r2, 93
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

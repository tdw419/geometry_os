; DESCRIPTION: Creates a black rectangular region at (322, 155) spanning 96 by 69 pixels.
; PLAN: r0=322(x), r1=155(y), r2=96(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 155
LDI r2, 96
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

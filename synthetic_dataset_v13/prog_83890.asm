; DESCRIPTION: Creates a black rectangular region at (142, 138) spanning 69 by 111 pixels.
; PLAN: r0=142(x), r1=138(y), r2=69(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 138
LDI r2, 69
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

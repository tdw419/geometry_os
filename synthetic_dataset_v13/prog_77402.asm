; DESCRIPTION: Creates a black rectangular region at (74, 140) spanning 69 by 105 pixels.
; PLAN: r0=74(x), r1=140(y), r2=69(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 140
LDI r2, 69
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

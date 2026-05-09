; DESCRIPTION: Creates a blue rectangular region at (158, 69) spanning 26 by 53 pixels.
; PLAN: r0=158(x), r1=69(y), r2=26(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 69
LDI r2, 26
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

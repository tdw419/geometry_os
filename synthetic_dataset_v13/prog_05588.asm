; DESCRIPTION: Creates a blue rectangular region at (461, 69) spanning 24 by 83 pixels.
; PLAN: r0=461(x), r1=69(y), r2=24(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 69
LDI r2, 24
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

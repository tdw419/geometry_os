; DESCRIPTION: Creates a blue rectangular region at (29, 102) spanning 112 by 53 pixels.
; PLAN: r0=29(x), r1=102(y), r2=112(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 102
LDI r2, 112
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

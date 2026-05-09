; DESCRIPTION: Creates a blue rectangular region at (53, 53) spanning 114 by 17 pixels.
; PLAN: r0=53(x), r1=53(y), r2=114(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 53
LDI r2, 114
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

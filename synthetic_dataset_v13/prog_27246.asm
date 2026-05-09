; DESCRIPTION: Creates a blue rectangular region at (35, 53) spanning 81 by 114 pixels.
; PLAN: r0=35(x), r1=53(y), r2=81(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 53
LDI r2, 81
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

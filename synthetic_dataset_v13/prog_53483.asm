; DESCRIPTION: Creates a blue rectangular region at (148, 101) spanning 74 by 71 pixels.
; PLAN: r0=148(x), r1=101(y), r2=74(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 101
LDI r2, 74
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

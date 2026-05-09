; DESCRIPTION: Creates a blue rectangular region at (131, 76) spanning 71 by 29 pixels.
; PLAN: r0=131(x), r1=76(y), r2=71(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 76
LDI r2, 71
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

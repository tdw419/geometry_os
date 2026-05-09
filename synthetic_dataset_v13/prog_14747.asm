; DESCRIPTION: Creates a blue rectangular region at (78, 62) spanning 81 by 92 pixels.
; PLAN: r0=78(x), r1=62(y), r2=81(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 62
LDI r2, 81
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a blue rectangular region at (3, 158) spanning 76 by 36 pixels.
; PLAN: r0=3(x), r1=158(y), r2=76(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 158
LDI r2, 76
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

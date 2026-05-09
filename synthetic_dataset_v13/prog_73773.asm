; DESCRIPTION: Creates a blue rectangular region at (26, 92) spanning 36 by 49 pixels.
; PLAN: r0=26(x), r1=92(y), r2=36(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 92
LDI r2, 36
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

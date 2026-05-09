; DESCRIPTION: Creates a blue rectangular region at (31, 15) spanning 92 by 69 pixels.
; PLAN: r0=31(x), r1=15(y), r2=92(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 15
LDI r2, 92
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

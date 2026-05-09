; DESCRIPTION: Creates a blue rectangular region at (212, 101) spanning 66 by 108 pixels.
; PLAN: r0=212(x), r1=101(y), r2=66(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 101
LDI r2, 66
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

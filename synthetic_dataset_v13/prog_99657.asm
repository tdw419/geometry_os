; DESCRIPTION: Creates a blue rectangular region at (343, 90) spanning 55 by 101 pixels.
; PLAN: r0=343(x), r1=90(y), r2=55(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 90
LDI r2, 55
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

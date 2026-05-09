; DESCRIPTION: Creates a blue rectangular region at (119, 138) spanning 44 by 105 pixels.
; PLAN: r0=119(x), r1=138(y), r2=44(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 138
LDI r2, 44
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

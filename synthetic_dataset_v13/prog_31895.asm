; DESCRIPTION: Creates a blue rectangular region at (139, 78) spanning 55 by 78 pixels.
; PLAN: r0=139(x), r1=78(y), r2=55(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 78
LDI r2, 55
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

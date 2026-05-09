; DESCRIPTION: Creates a green rectangular region at (155, 139) spanning 119 by 92 pixels.
; PLAN: r0=155(x), r1=139(y), r2=119(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 139
LDI r2, 119
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

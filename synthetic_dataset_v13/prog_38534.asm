; DESCRIPTION: Creates a blue rectangular region at (139, 34) spanning 106 by 92 pixels.
; PLAN: r0=139(x), r1=34(y), r2=106(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 34
LDI r2, 106
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

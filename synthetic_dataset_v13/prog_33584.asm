; DESCRIPTION: Creates a blue rectangular region at (38, 139) spanning 53 by 31 pixels.
; PLAN: r0=38(x), r1=139(y), r2=53(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 139
LDI r2, 53
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

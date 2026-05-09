; DESCRIPTION: Creates a blue rectangular region at (0, 139) spanning 29 by 29 pixels.
; PLAN: r0=0(x), r1=139(y), r2=29(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 139
LDI r2, 29
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

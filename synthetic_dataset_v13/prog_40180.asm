; DESCRIPTION: Creates a blue rectangular region at (28, 139) spanning 31 by 116 pixels.
; PLAN: r0=28(x), r1=139(y), r2=31(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 139
LDI r2, 31
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

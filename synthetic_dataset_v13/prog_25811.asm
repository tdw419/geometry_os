; DESCRIPTION: Creates a magenta rectangular region at (201, 139) spanning 101 by 83 pixels.
; PLAN: r0=201(x), r1=139(y), r2=101(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 139
LDI r2, 101
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a magenta rectangular region at (382, 139) spanning 70 by 97 pixels.
; PLAN: r0=382(x), r1=139(y), r2=70(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 139
LDI r2, 70
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

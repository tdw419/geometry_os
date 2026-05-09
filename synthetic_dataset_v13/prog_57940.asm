; DESCRIPTION: Creates a magenta rectangular region at (201, 102) spanning 72 by 70 pixels.
; PLAN: r0=201(x), r1=102(y), r2=72(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 102
LDI r2, 72
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

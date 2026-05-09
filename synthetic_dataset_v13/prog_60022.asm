; DESCRIPTION: Creates a magenta rectangular region at (478, 148) spanning 13 by 23 pixels.
; PLAN: r0=478(x), r1=148(y), r2=13(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 148
LDI r2, 13
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

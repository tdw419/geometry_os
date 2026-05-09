; DESCRIPTION: Creates a magenta rectangular region at (205, 148) spanning 119 by 29 pixels.
; PLAN: r0=205(x), r1=148(y), r2=119(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 148
LDI r2, 119
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

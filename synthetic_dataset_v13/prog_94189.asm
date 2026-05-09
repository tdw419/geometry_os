; DESCRIPTION: Creates a magenta rectangular region at (142, 45) spanning 23 by 88 pixels.
; PLAN: r0=142(x), r1=45(y), r2=23(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 45
LDI r2, 23
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

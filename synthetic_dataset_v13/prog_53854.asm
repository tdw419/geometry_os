; DESCRIPTION: Creates a magenta rectangular region at (135, 219) spanning 69 by 23 pixels.
; PLAN: r0=135(x), r1=219(y), r2=69(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 219
LDI r2, 69
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

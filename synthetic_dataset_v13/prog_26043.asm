; DESCRIPTION: Creates a magenta rectangular region at (10, 63) spanning 35 by 62 pixels.
; PLAN: r0=10(x), r1=63(y), r2=35(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 63
LDI r2, 35
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a magenta rectangular region at (258, 122) spanning 63 by 10 pixels.
; PLAN: r0=258(x), r1=122(y), r2=63(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 122
LDI r2, 63
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

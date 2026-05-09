; DESCRIPTION: Creates a magenta rectangular region at (84, 13) spanning 35 by 26 pixels.
; PLAN: r0=84(x), r1=13(y), r2=35(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 13
LDI r2, 35
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

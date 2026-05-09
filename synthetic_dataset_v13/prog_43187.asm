; DESCRIPTION: Creates a magenta rectangular region at (345, 6) spanning 76 by 19 pixels.
; PLAN: r0=345(x), r1=6(y), r2=76(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 6
LDI r2, 76
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a magenta rectangular region at (18, 97) spanning 43 by 81 pixels.
; PLAN: r0=18(x), r1=97(y), r2=43(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 97
LDI r2, 43
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

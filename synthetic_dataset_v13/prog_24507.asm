; DESCRIPTION: Creates a magenta rectangular region at (104, 19) spanning 101 by 97 pixels.
; PLAN: r0=104(x), r1=19(y), r2=101(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 19
LDI r2, 101
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

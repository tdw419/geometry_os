; DESCRIPTION: Creates a magenta rectangular region at (67, 8) spanning 97 by 51 pixels.
; PLAN: r0=67(x), r1=8(y), r2=97(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 8
LDI r2, 97
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

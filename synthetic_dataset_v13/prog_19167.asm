; DESCRIPTION: Creates a magenta rectangular region at (441, 14) spanning 35 by 114 pixels.
; PLAN: r0=441(x), r1=14(y), r2=35(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 14
LDI r2, 35
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

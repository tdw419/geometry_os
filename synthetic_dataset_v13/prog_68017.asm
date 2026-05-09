; DESCRIPTION: Creates a magenta rectangular region at (170, 114) spanning 101 by 73 pixels.
; PLAN: r0=170(x), r1=114(y), r2=101(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 114
LDI r2, 101
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

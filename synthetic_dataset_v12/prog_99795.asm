; DESCRIPTION: Creates a magenta rectangular region at (99, 53) spanning 71 by 74 pixels.
; PLAN: r0=99(x), r1=53(y), r2=71(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 53
LDI r2, 71
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a magenta rectangular region at (35, 81) spanning 71 by 68 pixels.
; PLAN: r0=35(x), r1=81(y), r2=71(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 81
LDI r2, 71
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

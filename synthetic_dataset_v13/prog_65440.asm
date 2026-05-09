; DESCRIPTION: Creates a magenta rectangular region at (35, 87) spanning 26 by 71 pixels.
; PLAN: r0=35(x), r1=87(y), r2=26(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 87
LDI r2, 26
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a magenta rectangular region at (70, 6) spanning 35 by 71 pixels.
; PLAN: r0=70(x), r1=6(y), r2=35(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 6
LDI r2, 35
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

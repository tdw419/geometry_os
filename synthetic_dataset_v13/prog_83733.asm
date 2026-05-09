; DESCRIPTION: Creates a magenta rectangular region at (94, 10) spanning 81 by 102 pixels.
; PLAN: r0=94(x), r1=10(y), r2=81(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 10
LDI r2, 81
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

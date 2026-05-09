; DESCRIPTION: Creates a magenta rectangular region at (141, 53) spanning 106 by 90 pixels.
; PLAN: r0=141(x), r1=53(y), r2=106(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 53
LDI r2, 106
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

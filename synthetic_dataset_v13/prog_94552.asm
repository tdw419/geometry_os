; DESCRIPTION: Creates a magenta rectangular region at (319, 148) spanning 74 by 89 pixels.
; PLAN: r0=319(x), r1=148(y), r2=74(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 148
LDI r2, 74
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

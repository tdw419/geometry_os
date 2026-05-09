; DESCRIPTION: Creates a magenta rectangular region at (319, 74) spanning 22 by 113 pixels.
; PLAN: r0=319(x), r1=74(y), r2=22(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 74
LDI r2, 22
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

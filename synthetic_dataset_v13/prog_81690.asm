; DESCRIPTION: Creates a magenta rectangular region at (311, 117) spanning 113 by 108 pixels.
; PLAN: r0=311(x), r1=117(y), r2=113(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 117
LDI r2, 113
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

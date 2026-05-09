; DESCRIPTION: Creates a magenta rectangular region at (78, 82) spanning 111 by 114 pixels.
; PLAN: r0=78(x), r1=82(y), r2=111(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 82
LDI r2, 111
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

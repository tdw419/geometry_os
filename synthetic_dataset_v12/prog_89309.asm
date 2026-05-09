; DESCRIPTION: Creates a magenta rectangular region at (343, 113) spanning 12 by 111 pixels.
; PLAN: r0=343(x), r1=113(y), r2=12(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 113
LDI r2, 12
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

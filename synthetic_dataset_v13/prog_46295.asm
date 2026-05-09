; DESCRIPTION: Creates a magenta rectangular region at (291, 105) spanning 113 by 21 pixels.
; PLAN: r0=291(x), r1=105(y), r2=113(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 105
LDI r2, 113
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

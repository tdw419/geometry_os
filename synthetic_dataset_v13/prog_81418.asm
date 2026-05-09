; DESCRIPTION: Creates a magenta rectangular region at (399, 69) spanning 110 by 113 pixels.
; PLAN: r0=399(x), r1=69(y), r2=110(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 69
LDI r2, 110
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

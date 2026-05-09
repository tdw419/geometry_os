; DESCRIPTION: Creates a magenta rectangular region at (151, 100) spanning 103 by 43 pixels.
; PLAN: r0=151(x), r1=100(y), r2=103(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 100
LDI r2, 103
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

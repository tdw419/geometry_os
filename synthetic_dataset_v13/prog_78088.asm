; DESCRIPTION: Creates a magenta rectangular region at (421, 11) spanning 37 by 113 pixels.
; PLAN: r0=421(x), r1=11(y), r2=37(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 11
LDI r2, 37
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

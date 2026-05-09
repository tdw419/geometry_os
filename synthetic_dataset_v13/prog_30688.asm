; DESCRIPTION: Creates a magenta rectangular region at (11, 184) spanning 66 by 28 pixels.
; PLAN: r0=11(x), r1=184(y), r2=66(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 184
LDI r2, 66
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

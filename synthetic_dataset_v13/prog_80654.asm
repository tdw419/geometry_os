; DESCRIPTION: Creates a magenta rectangular region at (134, 184) spanning 52 by 48 pixels.
; PLAN: r0=134(x), r1=184(y), r2=52(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 184
LDI r2, 52
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

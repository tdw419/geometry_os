; DESCRIPTION: Creates a magenta rectangular region at (471, 134) spanning 20 by 76 pixels.
; PLAN: r0=471(x), r1=134(y), r2=20(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 134
LDI r2, 20
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

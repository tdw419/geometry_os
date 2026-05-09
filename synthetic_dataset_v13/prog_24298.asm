; DESCRIPTION: Creates a magenta rectangular region at (159, 138) spanning 28 by 70 pixels.
; PLAN: r0=159(x), r1=138(y), r2=28(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 138
LDI r2, 28
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

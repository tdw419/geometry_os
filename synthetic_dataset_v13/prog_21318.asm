; DESCRIPTION: Creates a magenta rectangular region at (125, 53) spanning 96 by 76 pixels.
; PLAN: r0=125(x), r1=53(y), r2=96(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 53
LDI r2, 96
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

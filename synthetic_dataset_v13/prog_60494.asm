; DESCRIPTION: Creates a magenta rectangular region at (238, 93) spanning 40 by 43 pixels.
; PLAN: r0=238(x), r1=93(y), r2=40(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 93
LDI r2, 40
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

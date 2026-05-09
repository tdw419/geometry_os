; DESCRIPTION: Creates a magenta rectangular region at (140, 54) spanning 76 by 93 pixels.
; PLAN: r0=140(x), r1=54(y), r2=76(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 54
LDI r2, 76
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a magenta rectangular region at (93, 48) spanning 83 by 102 pixels.
; PLAN: r0=93(x), r1=48(y), r2=83(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 48
LDI r2, 83
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

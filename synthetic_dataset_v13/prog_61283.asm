; DESCRIPTION: Creates a magenta rectangular region at (299, 139) spanning 57 by 44 pixels.
; PLAN: r0=299(x), r1=139(y), r2=57(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 139
LDI r2, 57
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a magenta rectangular region at (419, 62) spanning 35 by 61 pixels.
; PLAN: r0=419(x), r1=62(y), r2=35(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 62
LDI r2, 35
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

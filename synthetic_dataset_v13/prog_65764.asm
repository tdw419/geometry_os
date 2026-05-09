; DESCRIPTION: Creates a magenta rectangular region at (359, 24) spanning 24 by 39 pixels.
; PLAN: r0=359(x), r1=24(y), r2=24(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 24
LDI r2, 24
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

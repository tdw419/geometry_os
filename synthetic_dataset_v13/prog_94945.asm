; DESCRIPTION: Creates a magenta rectangular region at (426, 0) spanning 14 by 28 pixels.
; PLAN: r0=426(x), r1=0(y), r2=14(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 0
LDI r2, 14
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

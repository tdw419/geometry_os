; DESCRIPTION: Creates a magenta rectangular region at (426, 35) spanning 77 by 64 pixels.
; PLAN: r0=426(x), r1=35(y), r2=77(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 35
LDI r2, 77
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

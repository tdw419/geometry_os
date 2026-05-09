; DESCRIPTION: Creates a magenta rectangular region at (334, 105) spanning 64 by 25 pixels.
; PLAN: r0=334(x), r1=105(y), r2=64(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 105
LDI r2, 64
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a magenta rectangular region at (240, 64) spanning 35 by 94 pixels.
; PLAN: r0=240(x), r1=64(y), r2=35(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 64
LDI r2, 35
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

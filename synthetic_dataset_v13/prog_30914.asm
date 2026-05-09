; DESCRIPTION: Creates a magenta rectangular region at (90, 84) spanning 32 by 101 pixels.
; PLAN: r0=90(x), r1=84(y), r2=32(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 84
LDI r2, 32
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

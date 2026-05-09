; DESCRIPTION: Creates a magenta rectangular region at (15, 3) spanning 84 by 32 pixels.
; PLAN: r0=15(x), r1=3(y), r2=84(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 3
LDI r2, 84
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

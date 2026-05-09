; DESCRIPTION: Creates a magenta rectangular region at (265, 56) spanning 101 by 37 pixels.
; PLAN: r0=265(x), r1=56(y), r2=101(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 56
LDI r2, 101
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

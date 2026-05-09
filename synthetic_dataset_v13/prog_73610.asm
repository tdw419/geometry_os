; DESCRIPTION: Creates a magenta rectangular region at (193, 56) spanning 114 by 10 pixels.
; PLAN: r0=193(x), r1=56(y), r2=114(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 56
LDI r2, 114
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

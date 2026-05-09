; DESCRIPTION: Creates a magenta rectangular region at (99, 63) spanning 63 by 77 pixels.
; PLAN: r0=99(x), r1=63(y), r2=63(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 63
LDI r2, 63
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

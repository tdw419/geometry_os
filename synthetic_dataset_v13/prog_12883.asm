; DESCRIPTION: Creates a magenta rectangular region at (291, 63) spanning 117 by 75 pixels.
; PLAN: r0=291(x), r1=63(y), r2=117(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 63
LDI r2, 117
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

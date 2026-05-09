; DESCRIPTION: Creates a magenta rectangular region at (1, 19) spanning 85 by 87 pixels.
; PLAN: r0=1(x), r1=19(y), r2=85(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 19
LDI r2, 85
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

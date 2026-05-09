; DESCRIPTION: Creates a magenta rectangular region at (429, 87) spanning 52 by 85 pixels.
; PLAN: r0=429(x), r1=87(y), r2=52(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 87
LDI r2, 52
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

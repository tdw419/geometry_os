; DESCRIPTION: Creates a magenta rectangular region at (231, 126) spanning 85 by 19 pixels.
; PLAN: r0=231(x), r1=126(y), r2=85(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 126
LDI r2, 85
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

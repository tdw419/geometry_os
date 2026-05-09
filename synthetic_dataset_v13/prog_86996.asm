; DESCRIPTION: Creates a magenta rectangular region at (208, 126) spanning 89 by 100 pixels.
; PLAN: r0=208(x), r1=126(y), r2=89(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 126
LDI r2, 89
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

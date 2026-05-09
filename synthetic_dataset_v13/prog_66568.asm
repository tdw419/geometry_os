; DESCRIPTION: Creates a magenta rectangular region at (112, 15) spanning 63 by 115 pixels.
; PLAN: r0=112(x), r1=15(y), r2=63(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 15
LDI r2, 63
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

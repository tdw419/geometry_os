; DESCRIPTION: Creates a magenta rectangular region at (414, 63) spanning 83 by 118 pixels.
; PLAN: r0=414(x), r1=63(y), r2=83(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 63
LDI r2, 83
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

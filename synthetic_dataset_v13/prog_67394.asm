; DESCRIPTION: Creates a magenta rectangular region at (63, 58) spanning 101 by 110 pixels.
; PLAN: r0=63(x), r1=58(y), r2=101(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 58
LDI r2, 101
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

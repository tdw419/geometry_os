; DESCRIPTION: Creates a magenta rectangular region at (158, 172) spanning 50 by 63 pixels.
; PLAN: r0=158(x), r1=172(y), r2=50(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 172
LDI r2, 50
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

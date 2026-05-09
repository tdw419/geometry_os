; DESCRIPTION: Creates a magenta rectangular region at (366, 34) spanning 63 by 115 pixels.
; PLAN: r0=366(x), r1=34(y), r2=63(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 34
LDI r2, 63
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

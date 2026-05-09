; DESCRIPTION: Creates a magenta rectangular region at (50, 132) spanning 88 by 44 pixels.
; PLAN: r0=50(x), r1=132(y), r2=88(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 132
LDI r2, 88
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

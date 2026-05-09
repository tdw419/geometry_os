; DESCRIPTION: Creates a magenta rectangular region at (72, 145) spanning 43 by 90 pixels.
; PLAN: r0=72(x), r1=145(y), r2=43(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 145
LDI r2, 43
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

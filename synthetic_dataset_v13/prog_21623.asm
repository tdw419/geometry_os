; DESCRIPTION: Creates a magenta rectangular region at (15, 15) spanning 95 by 84 pixels.
; PLAN: r0=15(x), r1=15(y), r2=95(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 15
LDI r2, 95
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

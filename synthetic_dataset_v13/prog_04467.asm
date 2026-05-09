; DESCRIPTION: Creates a magenta rectangular region at (115, 41) spanning 15 by 56 pixels.
; PLAN: r0=115(x), r1=41(y), r2=15(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 41
LDI r2, 15
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

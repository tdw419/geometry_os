; DESCRIPTION: Creates a magenta rectangular region at (57, 84) spanning 41 by 115 pixels.
; PLAN: r0=57(x), r1=84(y), r2=41(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 84
LDI r2, 41
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

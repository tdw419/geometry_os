; DESCRIPTION: Creates a magenta rectangular region at (41, 2) spanning 70 by 107 pixels.
; PLAN: r0=41(x), r1=2(y), r2=70(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 2
LDI r2, 70
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

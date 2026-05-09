; DESCRIPTION: Creates a magenta rectangular region at (233, 41) spanning 23 by 72 pixels.
; PLAN: r0=233(x), r1=41(y), r2=23(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 41
LDI r2, 23
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

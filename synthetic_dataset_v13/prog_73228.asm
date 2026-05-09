; DESCRIPTION: Creates a magenta rectangular region at (36, 41) spanning 101 by 18 pixels.
; PLAN: r0=36(x), r1=41(y), r2=101(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 41
LDI r2, 101
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a magenta rectangular region at (10, 36) spanning 41 by 10 pixels.
; PLAN: r0=10(x), r1=36(y), r2=41(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 36
LDI r2, 41
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

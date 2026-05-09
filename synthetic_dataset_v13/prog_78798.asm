; DESCRIPTION: Creates a magenta rectangular region at (325, 62) spanning 117 by 41 pixels.
; PLAN: r0=325(x), r1=62(y), r2=117(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 62
LDI r2, 117
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

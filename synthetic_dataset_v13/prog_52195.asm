; DESCRIPTION: Creates a magenta rectangular region at (432, 53) spanning 49 by 76 pixels.
; PLAN: r0=432(x), r1=53(y), r2=49(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 53
LDI r2, 49
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

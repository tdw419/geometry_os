; DESCRIPTION: Creates a magenta rectangular region at (296, 41) spanning 92 by 89 pixels.
; PLAN: r0=296(x), r1=41(y), r2=92(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 41
LDI r2, 92
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

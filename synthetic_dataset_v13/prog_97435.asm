; DESCRIPTION: Creates a red rectangular region at (41, 126) spanning 89 by 36 pixels.
; PLAN: r0=41(x), r1=126(y), r2=89(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 126
LDI r2, 89
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

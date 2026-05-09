; DESCRIPTION: Creates a magenta rectangular region at (438, 98) spanning 41 by 31 pixels.
; PLAN: r0=438(x), r1=98(y), r2=41(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 98
LDI r2, 41
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a red rectangular region at (309, 157) spanning 41 by 36 pixels.
; PLAN: r0=309(x), r1=157(y), r2=41(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 157
LDI r2, 41
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

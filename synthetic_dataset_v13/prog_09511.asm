; DESCRIPTION: Creates a white rectangular region at (309, 58) spanning 35 by 41 pixels.
; PLAN: r0=309(x), r1=58(y), r2=35(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 58
LDI r2, 35
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

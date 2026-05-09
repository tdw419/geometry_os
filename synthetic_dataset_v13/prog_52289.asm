; DESCRIPTION: Creates a black rectangular region at (157, 115) spanning 41 by 107 pixels.
; PLAN: r0=157(x), r1=115(y), r2=41(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 115
LDI r2, 41
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

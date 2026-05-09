; DESCRIPTION: Creates a black rectangular region at (143, 41) spanning 98 by 115 pixels.
; PLAN: r0=143(x), r1=41(y), r2=98(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 41
LDI r2, 98
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

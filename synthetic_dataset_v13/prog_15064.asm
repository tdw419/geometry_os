; DESCRIPTION: Creates a black rectangular region at (47, 171) spanning 86 by 41 pixels.
; PLAN: r0=47(x), r1=171(y), r2=86(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 171
LDI r2, 86
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

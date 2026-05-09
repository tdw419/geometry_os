; DESCRIPTION: Creates a red rectangular region at (353, 41) spanning 66 by 76 pixels.
; PLAN: r0=353(x), r1=41(y), r2=66(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 41
LDI r2, 66
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

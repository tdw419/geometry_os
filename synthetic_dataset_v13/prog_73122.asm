; DESCRIPTION: Creates a red rectangular region at (272, 76) spanning 41 by 14 pixels.
; PLAN: r0=272(x), r1=76(y), r2=41(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 76
LDI r2, 41
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

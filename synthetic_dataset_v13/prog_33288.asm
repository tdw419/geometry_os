; DESCRIPTION: Creates a white rectangular region at (9, 155) spanning 41 by 98 pixels.
; PLAN: r0=9(x), r1=155(y), r2=41(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 155
LDI r2, 41
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

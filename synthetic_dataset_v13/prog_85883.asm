; DESCRIPTION: Creates a yellow rectangular region at (481, 41) spanning 23 by 107 pixels.
; PLAN: r0=481(x), r1=41(y), r2=23(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 41
LDI r2, 23
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

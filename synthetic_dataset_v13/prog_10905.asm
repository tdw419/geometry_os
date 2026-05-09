; DESCRIPTION: Creates a yellow rectangular region at (265, 3) spanning 41 by 82 pixels.
; PLAN: r0=265(x), r1=3(y), r2=41(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 3
LDI r2, 41
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

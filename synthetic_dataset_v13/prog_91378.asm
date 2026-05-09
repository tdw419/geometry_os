; DESCRIPTION: Creates a yellow rectangular region at (441, 3) spanning 15 by 41 pixels.
; PLAN: r0=441(x), r1=3(y), r2=15(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 3
LDI r2, 15
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

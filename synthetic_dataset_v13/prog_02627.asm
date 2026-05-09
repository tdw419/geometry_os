; DESCRIPTION: Creates a black rectangular region at (388, 41) spanning 84 by 27 pixels.
; PLAN: r0=388(x), r1=41(y), r2=84(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 41
LDI r2, 84
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

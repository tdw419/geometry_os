; DESCRIPTION: Creates a black rectangular region at (321, 41) spanning 46 by 45 pixels.
; PLAN: r0=321(x), r1=41(y), r2=46(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 41
LDI r2, 46
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

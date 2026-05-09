; DESCRIPTION: Creates a black rectangular region at (139, 41) spanning 54 by 110 pixels.
; PLAN: r0=139(x), r1=41(y), r2=54(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 41
LDI r2, 54
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

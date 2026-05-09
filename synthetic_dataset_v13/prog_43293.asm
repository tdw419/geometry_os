; DESCRIPTION: Creates a black rectangular region at (75, 104) spanning 12 by 41 pixels.
; PLAN: r0=75(x), r1=104(y), r2=12(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 104
LDI r2, 12
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

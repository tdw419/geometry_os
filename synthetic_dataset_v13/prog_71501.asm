; DESCRIPTION: Creates a black rectangular region at (29, 104) spanning 41 by 104 pixels.
; PLAN: r0=29(x), r1=104(y), r2=41(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 104
LDI r2, 41
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

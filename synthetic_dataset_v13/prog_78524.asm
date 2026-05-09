; DESCRIPTION: Creates a blue rectangular region at (241, 41) spanning 46 by 104 pixels.
; PLAN: r0=241(x), r1=41(y), r2=46(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 41
LDI r2, 46
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

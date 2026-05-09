; DESCRIPTION: Creates a black rectangular region at (186, 100) spanning 55 by 41 pixels.
; PLAN: r0=186(x), r1=100(y), r2=55(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 100
LDI r2, 55
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

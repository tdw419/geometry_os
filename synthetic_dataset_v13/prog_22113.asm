; DESCRIPTION: Creates a black rectangular region at (252, 121) spanning 77 by 28 pixels.
; PLAN: r0=252(x), r1=121(y), r2=77(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 121
LDI r2, 77
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

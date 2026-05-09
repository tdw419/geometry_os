; DESCRIPTION: Creates a black rectangular region at (173, 156) spanning 81 by 41 pixels.
; PLAN: r0=173(x), r1=156(y), r2=81(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 156
LDI r2, 81
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

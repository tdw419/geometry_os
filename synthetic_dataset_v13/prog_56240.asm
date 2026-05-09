; DESCRIPTION: Creates a black rectangular region at (56, 106) spanning 41 by 87 pixels.
; PLAN: r0=56(x), r1=106(y), r2=41(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 106
LDI r2, 41
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

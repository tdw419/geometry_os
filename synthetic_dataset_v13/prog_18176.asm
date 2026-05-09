; DESCRIPTION: Creates a black rectangular region at (5, 66) spanning 43 by 24 pixels.
; PLAN: r0=5(x), r1=66(y), r2=43(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 66
LDI r2, 43
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

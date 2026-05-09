; DESCRIPTION: Creates a purple rectangular region at (40, 5) spanning 41 by 43 pixels.
; PLAN: r0=40(x), r1=5(y), r2=41(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 5
LDI r2, 41
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a purple rectangular region at (230, 10) spanning 18 by 41 pixels.
; PLAN: r0=230(x), r1=10(y), r2=18(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 10
LDI r2, 18
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

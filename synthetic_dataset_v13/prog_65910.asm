; DESCRIPTION: Creates a purple rectangular region at (88, 206) spanning 52 by 41 pixels.
; PLAN: r0=88(x), r1=206(y), r2=52(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 206
LDI r2, 52
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a purple rectangular region at (101, 41) spanning 85 by 111 pixels.
; PLAN: r0=101(x), r1=41(y), r2=85(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 41
LDI r2, 85
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

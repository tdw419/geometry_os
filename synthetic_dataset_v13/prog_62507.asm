; DESCRIPTION: Creates a purple rectangular region at (41, 27) spanning 36 by 47 pixels.
; PLAN: r0=41(x), r1=27(y), r2=36(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 27
LDI r2, 36
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

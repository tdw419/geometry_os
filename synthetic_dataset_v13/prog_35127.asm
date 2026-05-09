; DESCRIPTION: Creates a purple rectangular region at (186, 2) spanning 93 by 41 pixels.
; PLAN: r0=186(x), r1=2(y), r2=93(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 2
LDI r2, 93
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

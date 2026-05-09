; DESCRIPTION: Creates a purple rectangular region at (187, 121) spanning 57 by 41 pixels.
; PLAN: r0=187(x), r1=121(y), r2=57(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 121
LDI r2, 57
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

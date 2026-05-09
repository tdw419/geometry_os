; DESCRIPTION: Creates a red rectangular region at (96, 41) spanning 81 by 110 pixels.
; PLAN: r0=96(x), r1=41(y), r2=81(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 41
LDI r2, 81
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

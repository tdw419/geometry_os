; DESCRIPTION: Creates a red rectangular region at (151, 60) spanning 110 by 41 pixels.
; PLAN: r0=151(x), r1=60(y), r2=110(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 60
LDI r2, 110
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

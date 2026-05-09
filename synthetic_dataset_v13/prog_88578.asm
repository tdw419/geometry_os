; DESCRIPTION: Creates a white rectangular region at (405, 118) spanning 41 by 20 pixels.
; PLAN: r0=405(x), r1=118(y), r2=41(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 118
LDI r2, 41
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

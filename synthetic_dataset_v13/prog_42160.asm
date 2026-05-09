; DESCRIPTION: Creates a white rectangular region at (319, 61) spanning 41 by 65 pixels.
; PLAN: r0=319(x), r1=61(y), r2=41(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 61
LDI r2, 41
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a white rectangular region at (264, 11) spanning 28 by 41 pixels.
; PLAN: r0=264(x), r1=11(y), r2=28(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 11
LDI r2, 28
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

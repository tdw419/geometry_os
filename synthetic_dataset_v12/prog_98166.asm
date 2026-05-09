; DESCRIPTION: Creates a white rectangular region at (52, 148) spanning 39 by 41 pixels.
; PLAN: r0=52(x), r1=148(y), r2=39(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 148
LDI r2, 39
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

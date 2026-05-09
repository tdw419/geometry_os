; DESCRIPTION: Creates a white rectangular region at (82, 25) spanning 69 by 41 pixels.
; PLAN: r0=82(x), r1=25(y), r2=69(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 25
LDI r2, 69
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

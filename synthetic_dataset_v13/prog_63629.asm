; DESCRIPTION: Creates a red rectangular region at (388, 79) spanning 41 by 69 pixels.
; PLAN: r0=388(x), r1=79(y), r2=41(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 79
LDI r2, 41
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

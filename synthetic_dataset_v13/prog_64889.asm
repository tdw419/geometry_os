; DESCRIPTION: Creates a magenta rectangular region at (166, 200) spanning 102 by 41 pixels.
; PLAN: r0=166(x), r1=200(y), r2=102(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 200
LDI r2, 102
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

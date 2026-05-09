; DESCRIPTION: Creates a red rectangular region at (286, 134) spanning 40 by 41 pixels.
; PLAN: r0=286(x), r1=134(y), r2=40(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 134
LDI r2, 40
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

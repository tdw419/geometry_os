; DESCRIPTION: Creates a white rectangular region at (267, 134) spanning 41 by 109 pixels.
; PLAN: r0=267(x), r1=134(y), r2=41(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 134
LDI r2, 41
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

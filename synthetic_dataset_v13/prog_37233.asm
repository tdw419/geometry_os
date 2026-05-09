; DESCRIPTION: Creates a white rectangular region at (352, 93) spanning 41 by 113 pixels.
; PLAN: r0=352(x), r1=93(y), r2=41(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 93
LDI r2, 41
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

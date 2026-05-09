; DESCRIPTION: Creates a white rectangular region at (416, 41) spanning 22 by 93 pixels.
; PLAN: r0=416(x), r1=41(y), r2=22(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 41
LDI r2, 22
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

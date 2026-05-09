; DESCRIPTION: Creates a red rectangular region at (396, 59) spanning 110 by 41 pixels.
; PLAN: r0=396(x), r1=59(y), r2=110(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 59
LDI r2, 110
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

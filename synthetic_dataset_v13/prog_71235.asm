; DESCRIPTION: Creates a red rectangular region at (120, 41) spanning 117 by 84 pixels.
; PLAN: r0=120(x), r1=41(y), r2=117(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 41
LDI r2, 117
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

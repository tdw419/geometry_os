; DESCRIPTION: Creates a orange rectangular region at (41, 55) spanning 48 by 95 pixels.
; PLAN: r0=41(x), r1=55(y), r2=48(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 55
LDI r2, 48
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

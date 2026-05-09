; DESCRIPTION: Creates a orange rectangular region at (96, 41) spanning 14 by 29 pixels.
; PLAN: r0=96(x), r1=41(y), r2=14(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 41
LDI r2, 14
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

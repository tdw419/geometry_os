; DESCRIPTION: Creates a orange rectangular region at (81, 41) spanning 86 by 73 pixels.
; PLAN: r0=81(x), r1=41(y), r2=86(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 41
LDI r2, 86
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

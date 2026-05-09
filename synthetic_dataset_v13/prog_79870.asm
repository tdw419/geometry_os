; DESCRIPTION: Creates a orange rectangular region at (191, 41) spanning 86 by 119 pixels.
; PLAN: r0=191(x), r1=41(y), r2=86(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 41
LDI r2, 86
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

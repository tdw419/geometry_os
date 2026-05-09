; DESCRIPTION: Creates a orange rectangular region at (203, 41) spanning 91 by 96 pixels.
; PLAN: r0=203(x), r1=41(y), r2=91(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 41
LDI r2, 91
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

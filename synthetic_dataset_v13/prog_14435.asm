; DESCRIPTION: Creates a orange rectangular region at (203, 144) spanning 104 by 41 pixels.
; PLAN: r0=203(x), r1=144(y), r2=104(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 144
LDI r2, 104
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

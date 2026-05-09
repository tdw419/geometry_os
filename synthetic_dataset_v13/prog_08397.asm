; DESCRIPTION: Creates a orange rectangular region at (253, 30) spanning 41 by 12 pixels.
; PLAN: r0=253(x), r1=30(y), r2=41(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 30
LDI r2, 41
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a orange rectangular region at (106, 58) spanning 41 by 90 pixels.
; PLAN: r0=106(x), r1=58(y), r2=41(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 58
LDI r2, 41
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

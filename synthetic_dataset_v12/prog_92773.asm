; DESCRIPTION: Creates a orange rectangular region at (432, 172) spanning 68 by 72 pixels.
; PLAN: r0=432(x), r1=172(y), r2=68(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 172
LDI r2, 68
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

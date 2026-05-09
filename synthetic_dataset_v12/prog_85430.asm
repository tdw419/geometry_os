; DESCRIPTION: Creates a orange rectangular region at (16, 53) spanning 41 by 36 pixels.
; PLAN: r0=16(x), r1=53(y), r2=41(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 53
LDI r2, 41
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

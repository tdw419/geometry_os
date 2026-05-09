; DESCRIPTION: Creates a orange rectangular region at (131, 50) spanning 41 by 21 pixels.
; PLAN: r0=131(x), r1=50(y), r2=41(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 50
LDI r2, 41
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

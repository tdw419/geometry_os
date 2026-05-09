; DESCRIPTION: Creates a orange rectangular region at (393, 100) spanning 53 by 119 pixels.
; PLAN: r0=393(x), r1=100(y), r2=53(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 100
LDI r2, 53
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

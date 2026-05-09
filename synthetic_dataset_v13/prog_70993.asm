; DESCRIPTION: Creates a orange rectangular region at (481, 5) spanning 15 by 53 pixels.
; PLAN: r0=481(x), r1=5(y), r2=15(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 5
LDI r2, 15
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

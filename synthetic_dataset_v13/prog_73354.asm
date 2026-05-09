; DESCRIPTION: Creates a orange rectangular region at (481, 70) spanning 20 by 101 pixels.
; PLAN: r0=481(x), r1=70(y), r2=20(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 70
LDI r2, 20
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

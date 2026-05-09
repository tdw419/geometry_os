; DESCRIPTION: Creates a orange rectangular region at (432, 55) spanning 52 by 108 pixels.
; PLAN: r0=432(x), r1=55(y), r2=52(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 55
LDI r2, 52
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a orange rectangular region at (432, 240) spanning 11 by 10 pixels.
; PLAN: r0=432(x), r1=240(y), r2=11(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 240
LDI r2, 11
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

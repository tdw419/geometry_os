; DESCRIPTION: Creates a orange rectangular region at (2, 132) spanning 100 by 37 pixels.
; PLAN: r0=2(x), r1=132(y), r2=100(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 132
LDI r2, 100
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

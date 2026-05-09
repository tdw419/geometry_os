; DESCRIPTION: Creates a orange rectangular region at (361, 105) spanning 23 by 56 pixels.
; PLAN: r0=361(x), r1=105(y), r2=23(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 105
LDI r2, 23
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

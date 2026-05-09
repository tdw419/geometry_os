; DESCRIPTION: Creates a orange rectangular region at (83, 117) spanning 43 by 87 pixels.
; PLAN: r0=83(x), r1=117(y), r2=43(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 117
LDI r2, 43
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

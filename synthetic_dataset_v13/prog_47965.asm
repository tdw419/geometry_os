; DESCRIPTION: Creates a orange rectangular region at (351, 132) spanning 30 by 78 pixels.
; PLAN: r0=351(x), r1=132(y), r2=30(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 132
LDI r2, 30
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

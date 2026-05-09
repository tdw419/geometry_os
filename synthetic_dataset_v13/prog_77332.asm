; DESCRIPTION: Creates a orange rectangular region at (89, 97) spanning 85 by 36 pixels.
; PLAN: r0=89(x), r1=97(y), r2=85(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 97
LDI r2, 85
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

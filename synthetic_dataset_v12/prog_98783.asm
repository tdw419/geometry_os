; DESCRIPTION: Creates a orange rectangular region at (227, 94) spanning 65 by 89 pixels.
; PLAN: r0=227(x), r1=94(y), r2=65(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 94
LDI r2, 65
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

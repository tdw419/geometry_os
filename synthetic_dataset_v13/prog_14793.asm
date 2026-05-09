; DESCRIPTION: Creates a orange rectangular region at (155, 176) spanning 31 by 20 pixels.
; PLAN: r0=155(x), r1=176(y), r2=31(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 176
LDI r2, 31
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

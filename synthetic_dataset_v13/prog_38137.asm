; DESCRIPTION: Creates a orange rectangular region at (184, 99) spanning 110 by 107 pixels.
; PLAN: r0=184(x), r1=99(y), r2=110(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 99
LDI r2, 110
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a orange rectangular region at (212, 176) spanning 78 by 12 pixels.
; PLAN: r0=212(x), r1=176(y), r2=78(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 176
LDI r2, 78
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

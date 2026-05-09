; DESCRIPTION: Creates a orange rectangular region at (357, 16) spanning 37 by 52 pixels.
; PLAN: r0=357(x), r1=16(y), r2=37(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 16
LDI r2, 37
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

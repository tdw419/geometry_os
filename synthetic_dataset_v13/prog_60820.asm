; DESCRIPTION: Places a orange 76x20 rectangle at position (357, 155).
; PLAN: r0=357(x), r1=155(y), r2=76(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 155
LDI r2, 76
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

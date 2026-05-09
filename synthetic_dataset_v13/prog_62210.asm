; DESCRIPTION: Places a orange 20x108 rectangle at position (283, 110).
; PLAN: r0=283(x), r1=110(y), r2=20(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 110
LDI r2, 20
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

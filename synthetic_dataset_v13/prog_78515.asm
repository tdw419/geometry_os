; DESCRIPTION: Creates a orange rectangular region at (390, 155) spanning 120 by 56 pixels.
; PLAN: r0=390(x), r1=155(y), r2=120(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 155
LDI r2, 120
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

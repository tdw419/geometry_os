; DESCRIPTION: Places a orange 20x77 rectangle at position (359, 145).
; PLAN: r0=359(x), r1=145(y), r2=20(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 145
LDI r2, 20
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

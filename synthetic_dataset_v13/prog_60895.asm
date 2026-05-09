; DESCRIPTION: Draws a orange rectangle at (467, 56) with width 26 and height 99.
; PLAN: r0=467(x), r1=56(y), r2=26(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 56
LDI r2, 26
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

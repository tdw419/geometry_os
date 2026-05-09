; DESCRIPTION: Draws a orange rectangle at (356, 23) with width 107 and height 52.
; PLAN: r0=356(x), r1=23(y), r2=107(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 23
LDI r2, 107
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a orange rectangle at (234, 99) with width 56 and height 48.
; PLAN: r0=234(x), r1=99(y), r2=56(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 99
LDI r2, 56
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

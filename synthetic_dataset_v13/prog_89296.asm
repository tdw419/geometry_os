; DESCRIPTION: Draws a orange rectangle at (191, 145) with width 13 and height 48.
; PLAN: r0=191(x), r1=145(y), r2=13(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 145
LDI r2, 13
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

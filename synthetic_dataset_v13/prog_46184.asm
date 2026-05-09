; DESCRIPTION: Draws a orange rectangle at (250, 21) with width 39 and height 63.
; PLAN: r0=250(x), r1=21(y), r2=39(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 21
LDI r2, 39
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

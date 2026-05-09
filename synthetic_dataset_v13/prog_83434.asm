; DESCRIPTION: Draws a orange rectangle at (164, 27) with width 63 and height 17.
; PLAN: r0=164(x), r1=27(y), r2=63(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 27
LDI r2, 63
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

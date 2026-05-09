; DESCRIPTION: Draws a orange rectangle at (50, 63) with width 81 and height 51.
; PLAN: r0=50(x), r1=63(y), r2=81(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 63
LDI r2, 81
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a orange rectangle at (427, 40) with width 32 and height 51.
; PLAN: r0=427(x), r1=40(y), r2=32(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 40
LDI r2, 32
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

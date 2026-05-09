; DESCRIPTION: Draws a orange rectangle at (196, 136) with width 14 and height 111.
; PLAN: r0=196(x), r1=136(y), r2=14(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 136
LDI r2, 14
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

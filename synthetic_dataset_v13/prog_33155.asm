; DESCRIPTION: Draws a black rectangle at (196, 103) with width 37 and height 63.
; PLAN: r0=196(x), r1=103(y), r2=37(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 103
LDI r2, 37
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

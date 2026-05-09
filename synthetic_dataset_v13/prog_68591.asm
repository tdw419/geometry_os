; DESCRIPTION: Draws a yellow rectangle at (125, 53) with width 51 and height 64.
; PLAN: r0=125(x), r1=53(y), r2=51(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 53
LDI r2, 51
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

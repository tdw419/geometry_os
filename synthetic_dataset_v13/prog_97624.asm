; DESCRIPTION: Draws a purple rectangle at (327, 117) with width 51 and height 10.
; PLAN: r0=327(x), r1=117(y), r2=51(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 117
LDI r2, 51
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

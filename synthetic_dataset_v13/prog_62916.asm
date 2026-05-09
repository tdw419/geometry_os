; DESCRIPTION: Draws a black rectangle at (326, 51) with width 39 and height 80.
; PLAN: r0=326(x), r1=51(y), r2=39(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 51
LDI r2, 39
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

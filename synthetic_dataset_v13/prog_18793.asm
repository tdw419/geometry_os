; DESCRIPTION: Draws a black rectangle at (342, 8) with width 98 and height 51.
; PLAN: r0=342(x), r1=8(y), r2=98(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 8
LDI r2, 98
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a white rectangle at (111, 162) with width 40 and height 51.
; PLAN: r0=111(x), r1=162(y), r2=40(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 162
LDI r2, 40
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

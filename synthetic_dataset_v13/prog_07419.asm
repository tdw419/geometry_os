; DESCRIPTION: Draws a red rectangle at (350, 72) with width 51 and height 117.
; PLAN: r0=350(x), r1=72(y), r2=51(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 72
LDI r2, 51
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a red rectangle at (292, 135) with width 65 and height 51.
; PLAN: r0=292(x), r1=135(y), r2=65(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 135
LDI r2, 65
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

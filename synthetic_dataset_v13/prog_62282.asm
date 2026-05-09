; DESCRIPTION: Draws a red rectangle at (297, 28) with width 51 and height 75.
; PLAN: r0=297(x), r1=28(y), r2=51(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 28
LDI r2, 51
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

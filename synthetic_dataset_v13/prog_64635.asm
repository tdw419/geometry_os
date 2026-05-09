; DESCRIPTION: Draws a red rectangle at (150, 39) with width 25 and height 51.
; PLAN: r0=150(x), r1=39(y), r2=25(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 39
LDI r2, 25
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

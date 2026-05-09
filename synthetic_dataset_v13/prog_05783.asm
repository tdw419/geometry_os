; DESCRIPTION: Draws a red rectangle at (347, 52) with width 120 and height 51.
; PLAN: r0=347(x), r1=52(y), r2=120(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 52
LDI r2, 120
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

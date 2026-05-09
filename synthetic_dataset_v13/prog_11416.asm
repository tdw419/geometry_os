; DESCRIPTION: Draws a red rectangle at (394, 155) with width 52 and height 51.
; PLAN: r0=394(x), r1=155(y), r2=52(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 155
LDI r2, 52
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a red rectangle at (327, 51) with width 62 and height 115.
; PLAN: r0=327(x), r1=51(y), r2=62(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 51
LDI r2, 62
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

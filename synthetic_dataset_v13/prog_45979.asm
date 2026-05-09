; DESCRIPTION: Draws a red rectangle at (396, 93) with width 11 and height 110.
; PLAN: r0=396(x), r1=93(y), r2=11(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 93
LDI r2, 11
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

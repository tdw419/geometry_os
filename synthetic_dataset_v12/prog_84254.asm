; DESCRIPTION: Draws a red rectangle at (419, 109) with width 35 and height 101.
; PLAN: r0=419(x), r1=109(y), r2=35(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 109
LDI r2, 35
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a red rectangle at (419, 119) with width 10 and height 83.
; PLAN: r0=419(x), r1=119(y), r2=10(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 119
LDI r2, 10
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

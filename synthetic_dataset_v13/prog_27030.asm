; DESCRIPTION: Draws a purple rectangle at (292, 9) with width 48 and height 95.
; PLAN: r0=292(x), r1=9(y), r2=48(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 9
LDI r2, 48
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

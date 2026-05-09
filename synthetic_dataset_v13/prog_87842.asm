; DESCRIPTION: Draws a blue rectangle at (292, 50) with width 65 and height 18.
; PLAN: r0=292(x), r1=50(y), r2=65(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 50
LDI r2, 65
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

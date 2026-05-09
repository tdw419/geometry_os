; DESCRIPTION: Draws a orange rectangle at (292, 45) with width 90 and height 25.
; PLAN: r0=292(x), r1=45(y), r2=90(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 45
LDI r2, 90
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

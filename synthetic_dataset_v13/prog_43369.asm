; DESCRIPTION: Draws a orange rectangle at (317, 12) with width 115 and height 69.
; PLAN: r0=317(x), r1=12(y), r2=115(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 12
LDI r2, 115
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

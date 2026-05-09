; DESCRIPTION: Draws a red rectangle at (254, 75) with width 75 and height 65.
; PLAN: r0=254(x), r1=75(y), r2=75(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 75
LDI r2, 75
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a red rectangle at (196, 65) with width 12 and height 75.
; PLAN: r0=196(x), r1=65(y), r2=12(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 65
LDI r2, 12
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

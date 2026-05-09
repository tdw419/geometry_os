; DESCRIPTION: Draws a red rectangle at (10, 105) with width 30 and height 63.
; PLAN: r0=10(x), r1=105(y), r2=30(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 105
LDI r2, 30
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

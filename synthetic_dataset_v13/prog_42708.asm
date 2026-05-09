; DESCRIPTION: Draws a orange rectangle at (36, 65) with width 10 and height 38.
; PLAN: r0=36(x), r1=65(y), r2=10(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 65
LDI r2, 10
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

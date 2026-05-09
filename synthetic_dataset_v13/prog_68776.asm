; DESCRIPTION: Draws a orange rectangle at (302, 27) with width 74 and height 52.
; PLAN: r0=302(x), r1=27(y), r2=74(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 27
LDI r2, 74
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

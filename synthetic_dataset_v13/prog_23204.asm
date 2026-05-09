; DESCRIPTION: Draws a orange rectangle at (161, 54) with width 93 and height 120.
; PLAN: r0=161(x), r1=54(y), r2=93(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 54
LDI r2, 93
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

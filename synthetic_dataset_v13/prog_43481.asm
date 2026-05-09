; DESCRIPTION: Draws a orange rectangle at (158, 11) with width 120 and height 14.
; PLAN: r0=158(x), r1=11(y), r2=120(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 11
LDI r2, 120
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

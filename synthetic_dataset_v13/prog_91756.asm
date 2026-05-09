; DESCRIPTION: Draws a orange rectangle at (101, 115) with width 94 and height 120.
; PLAN: r0=101(x), r1=115(y), r2=94(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 115
LDI r2, 94
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

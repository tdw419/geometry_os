; DESCRIPTION: Draws a orange rectangle at (197, 52) with width 94 and height 101.
; PLAN: r0=197(x), r1=52(y), r2=94(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 52
LDI r2, 94
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

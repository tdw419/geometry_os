; DESCRIPTION: Draws a orange rectangle at (221, 94) with width 117 and height 75.
; PLAN: r0=221(x), r1=94(y), r2=117(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 94
LDI r2, 117
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

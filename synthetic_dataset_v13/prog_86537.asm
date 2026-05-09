; DESCRIPTION: Draws a orange rectangle at (389, 162) with width 46 and height 94.
; PLAN: r0=389(x), r1=162(y), r2=46(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 162
LDI r2, 46
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

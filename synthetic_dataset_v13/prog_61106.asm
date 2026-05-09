; DESCRIPTION: Draws a orange rectangle at (355, 117) with width 48 and height 115.
; PLAN: r0=355(x), r1=117(y), r2=48(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 117
LDI r2, 48
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

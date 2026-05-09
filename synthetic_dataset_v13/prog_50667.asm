; DESCRIPTION: Draws a orange rectangle at (258, 40) with width 115 and height 27.
; PLAN: r0=258(x), r1=40(y), r2=115(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 40
LDI r2, 115
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

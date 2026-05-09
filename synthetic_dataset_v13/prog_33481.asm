; DESCRIPTION: Draws a orange rectangle at (406, 2) with width 94 and height 63.
; PLAN: r0=406(x), r1=2(y), r2=94(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 2
LDI r2, 94
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

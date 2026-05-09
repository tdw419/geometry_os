; DESCRIPTION: Draws a orange rectangle at (3, 0) with width 22 and height 111.
; PLAN: r0=3(x), r1=0(y), r2=22(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 0
LDI r2, 22
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

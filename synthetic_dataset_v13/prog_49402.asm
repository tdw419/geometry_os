; DESCRIPTION: Draws a orange rectangle at (279, 9) with width 111 and height 47.
; PLAN: r0=279(x), r1=9(y), r2=111(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 9
LDI r2, 111
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a orange rectangle at (83, 78) with width 74 and height 111.
; PLAN: r0=83(x), r1=78(y), r2=74(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 78
LDI r2, 74
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

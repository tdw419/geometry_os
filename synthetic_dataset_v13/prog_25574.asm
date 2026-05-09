; DESCRIPTION: Draws a orange rectangle at (251, 71) with width 111 and height 69.
; PLAN: r0=251(x), r1=71(y), r2=111(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 71
LDI r2, 111
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

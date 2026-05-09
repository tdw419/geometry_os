; DESCRIPTION: Draws a orange rectangle at (90, 124) with width 69 and height 26.
; PLAN: r0=90(x), r1=124(y), r2=69(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 124
LDI r2, 69
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a orange rectangle at (69, 59) with width 21 and height 30.
; PLAN: r0=69(x), r1=59(y), r2=21(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 59
LDI r2, 21
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

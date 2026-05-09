; DESCRIPTION: Draws a orange rectangle at (124, 164) with width 59 and height 33.
; PLAN: r0=124(x), r1=164(y), r2=59(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 164
LDI r2, 59
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a orange rectangle at (76, 124) with width 56 and height 12.
; PLAN: r0=76(x), r1=124(y), r2=56(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 124
LDI r2, 56
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

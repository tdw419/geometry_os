; DESCRIPTION: Draws a orange rectangle at (48, 83) with width 105 and height 105.
; PLAN: r0=48(x), r1=83(y), r2=105(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 83
LDI r2, 105
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

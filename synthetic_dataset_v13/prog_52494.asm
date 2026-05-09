; DESCRIPTION: Draws a orange rectangle at (310, 77) with width 120 and height 44.
; PLAN: r0=310(x), r1=77(y), r2=120(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 77
LDI r2, 120
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

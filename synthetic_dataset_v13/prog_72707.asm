; DESCRIPTION: Draws a orange rectangle at (71, 56) with width 77 and height 80.
; PLAN: r0=71(x), r1=56(y), r2=77(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 56
LDI r2, 77
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

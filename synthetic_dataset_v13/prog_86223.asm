; DESCRIPTION: Draws a orange rectangle at (185, 46) with width 77 and height 110.
; PLAN: r0=185(x), r1=46(y), r2=77(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 46
LDI r2, 77
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

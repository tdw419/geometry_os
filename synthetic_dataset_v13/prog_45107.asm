; DESCRIPTION: Draws a orange rectangle at (365, 9) with width 47 and height 37.
; PLAN: r0=365(x), r1=9(y), r2=47(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 9
LDI r2, 47
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a yellow rectangle at (275, 15) with width 87 and height 119.
; PLAN: r0=275(x), r1=15(y), r2=87(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 15
LDI r2, 87
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

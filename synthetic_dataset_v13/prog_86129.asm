; DESCRIPTION: Draws a yellow rectangle at (143, 56) with width 110 and height 12.
; PLAN: r0=143(x), r1=56(y), r2=110(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 56
LDI r2, 110
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

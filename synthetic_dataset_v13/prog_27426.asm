; DESCRIPTION: Draws a orange rectangle at (279, 126) with width 110 and height 12.
; PLAN: r0=279(x), r1=126(y), r2=110(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 126
LDI r2, 110
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

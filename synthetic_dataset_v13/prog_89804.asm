; DESCRIPTION: Draws a orange rectangle at (260, 16) with width 52 and height 56.
; PLAN: r0=260(x), r1=16(y), r2=52(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 16
LDI r2, 52
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a orange rectangle at (260, 54) with width 112 and height 31.
; PLAN: r0=260(x), r1=54(y), r2=112(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 54
LDI r2, 112
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

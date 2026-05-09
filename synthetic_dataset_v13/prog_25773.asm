; DESCRIPTION: Draws a orange rectangle at (177, 28) with width 52 and height 109.
; PLAN: r0=177(x), r1=28(y), r2=52(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 28
LDI r2, 52
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

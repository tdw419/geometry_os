; DESCRIPTION: Draws a orange rectangle at (199, 137) with width 61 and height 52.
; PLAN: r0=199(x), r1=137(y), r2=61(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 137
LDI r2, 61
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

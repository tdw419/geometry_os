; DESCRIPTION: Draws a yellow rectangle at (199, 75) with width 74 and height 64.
; PLAN: r0=199(x), r1=75(y), r2=74(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 75
LDI r2, 74
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

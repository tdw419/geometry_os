; DESCRIPTION: Draws a green rectangle at (199, 60) with width 37 and height 38.
; PLAN: r0=199(x), r1=60(y), r2=37(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 60
LDI r2, 37
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a green rectangle at (199, 74) with width 113 and height 105.
; PLAN: r0=199(x), r1=74(y), r2=113(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 74
LDI r2, 113
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

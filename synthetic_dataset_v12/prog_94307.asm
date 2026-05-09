; DESCRIPTION: Draws a white rectangle at (199, 171) with width 110 and height 54.
; PLAN: r0=199(x), r1=171(y), r2=110(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 171
LDI r2, 110
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

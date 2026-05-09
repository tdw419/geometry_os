; DESCRIPTION: Draws a white rectangle at (199, 163) with width 28 and height 10.
; PLAN: r0=199(x), r1=163(y), r2=28(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 163
LDI r2, 28
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

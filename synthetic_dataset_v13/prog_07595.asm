; DESCRIPTION: Draws a red rectangle at (199, 2) with width 49 and height 63.
; PLAN: r0=199(x), r1=2(y), r2=49(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 2
LDI r2, 49
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

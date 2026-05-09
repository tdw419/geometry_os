; DESCRIPTION: Draws a green rectangle at (199, 120) with width 31 and height 82.
; PLAN: r0=199(x), r1=120(y), r2=31(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 120
LDI r2, 31
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

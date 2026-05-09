; DESCRIPTION: Renders a white box of size 89x110 starting at (411, 105).
; PLAN: r0=411(x), r1=105(y), r2=89(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 105
LDI r2, 89
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

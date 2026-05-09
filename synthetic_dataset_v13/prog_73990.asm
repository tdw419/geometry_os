; DESCRIPTION: Renders a white box of size 100x36 starting at (207, 110).
; PLAN: r0=207(x), r1=110(y), r2=100(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 110
LDI r2, 100
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a green box of size 69x110 starting at (51, 33).
; PLAN: r0=51(x), r1=33(y), r2=69(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 33
LDI r2, 69
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

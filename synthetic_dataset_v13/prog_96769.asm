; DESCRIPTION: Renders a green box of size 110x91 starting at (51, 77).
; PLAN: r0=51(x), r1=77(y), r2=110(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 77
LDI r2, 110
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

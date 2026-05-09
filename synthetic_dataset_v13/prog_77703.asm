; DESCRIPTION: Renders a green box of size 78x10 starting at (51, 189).
; PLAN: r0=51(x), r1=189(y), r2=78(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 189
LDI r2, 78
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a green box of size 77x100 starting at (22, 75).
; PLAN: r0=22(x), r1=75(y), r2=77(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 75
LDI r2, 77
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

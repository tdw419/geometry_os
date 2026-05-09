; DESCRIPTION: Renders a green box of size 88x37 starting at (31, 51).
; PLAN: r0=31(x), r1=51(y), r2=88(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 51
LDI r2, 88
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

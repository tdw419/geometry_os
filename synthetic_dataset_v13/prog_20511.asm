; DESCRIPTION: Renders a green box of size 35x77 starting at (88, 23).
; PLAN: r0=88(x), r1=23(y), r2=35(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 23
LDI r2, 35
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

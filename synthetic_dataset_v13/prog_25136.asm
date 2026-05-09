; DESCRIPTION: Renders a green box of size 119x77 starting at (17, 87).
; PLAN: r0=17(x), r1=87(y), r2=119(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 87
LDI r2, 119
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

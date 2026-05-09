; DESCRIPTION: Renders a blue box of size 75x91 starting at (77, 115).
; PLAN: r0=77(x), r1=115(y), r2=75(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 115
LDI r2, 75
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

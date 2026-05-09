; DESCRIPTION: Renders a green box of size 51x103 starting at (192, 77).
; PLAN: r0=192(x), r1=77(y), r2=51(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 77
LDI r2, 51
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

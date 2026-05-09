; DESCRIPTION: Renders a green box of size 51x22 starting at (54, 52).
; PLAN: r0=54(x), r1=52(y), r2=51(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 52
LDI r2, 51
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

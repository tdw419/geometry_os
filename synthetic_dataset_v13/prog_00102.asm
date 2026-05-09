; DESCRIPTION: Renders a green box of size 49x105 starting at (81, 63).
; PLAN: r0=81(x), r1=63(y), r2=49(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 63
LDI r2, 49
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

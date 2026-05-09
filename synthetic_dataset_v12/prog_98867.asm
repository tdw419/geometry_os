; DESCRIPTION: Renders a green box of size 24x110 starting at (6, 115).
; PLAN: r0=6(x), r1=115(y), r2=24(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 115
LDI r2, 24
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

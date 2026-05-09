; DESCRIPTION: Renders a green box of size 19x37 starting at (2, 162).
; PLAN: r0=2(x), r1=162(y), r2=19(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 162
LDI r2, 19
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a green box of size 101x24 starting at (211, 106).
; PLAN: r0=211(x), r1=106(y), r2=101(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 106
LDI r2, 101
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

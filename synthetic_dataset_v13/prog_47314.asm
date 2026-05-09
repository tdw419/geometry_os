; DESCRIPTION: Renders a white box of size 24x94 starting at (99, 130).
; PLAN: r0=99(x), r1=130(y), r2=24(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 130
LDI r2, 24
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a green box of size 11x93 starting at (205, 130).
; PLAN: r0=205(x), r1=130(y), r2=11(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 130
LDI r2, 11
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

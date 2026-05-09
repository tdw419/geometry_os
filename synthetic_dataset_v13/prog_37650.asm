; DESCRIPTION: Renders a green box of size 74x100 starting at (406, 130).
; PLAN: r0=406(x), r1=130(y), r2=74(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 130
LDI r2, 74
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

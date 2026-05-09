; DESCRIPTION: Renders a green box of size 88x21 starting at (154, 130).
; PLAN: r0=154(x), r1=130(y), r2=88(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 130
LDI r2, 88
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

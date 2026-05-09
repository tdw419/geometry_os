; DESCRIPTION: Renders a green box of size 83x88 starting at (23, 20).
; PLAN: r0=23(x), r1=20(y), r2=83(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 20
LDI r2, 83
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a green box of size 43x62 starting at (20, 23).
; PLAN: r0=20(x), r1=23(y), r2=43(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 23
LDI r2, 43
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

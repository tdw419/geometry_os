; DESCRIPTION: Renders a green box of size 35x70 starting at (36, 62).
; PLAN: r0=36(x), r1=62(y), r2=35(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 62
LDI r2, 35
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

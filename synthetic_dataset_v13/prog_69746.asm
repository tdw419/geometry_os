; DESCRIPTION: Renders a green box of size 12x49 starting at (122, 99).
; PLAN: r0=122(x), r1=99(y), r2=12(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 99
LDI r2, 12
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

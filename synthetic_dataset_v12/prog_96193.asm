; DESCRIPTION: Renders a green box of size 37x58 starting at (310, 97).
; PLAN: r0=310(x), r1=97(y), r2=37(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 97
LDI r2, 37
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a blue box of size 22x37 starting at (370, 189).
; PLAN: r0=370(x), r1=189(y), r2=22(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 189
LDI r2, 22
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

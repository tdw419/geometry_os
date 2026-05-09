; DESCRIPTION: Renders a blue box of size 75x37 starting at (15, 71).
; PLAN: r0=15(x), r1=71(y), r2=75(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 71
LDI r2, 75
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

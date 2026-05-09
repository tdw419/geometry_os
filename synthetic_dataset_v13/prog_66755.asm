; DESCRIPTION: Renders a purple box of size 20x108 starting at (207, 89).
; PLAN: r0=207(x), r1=89(y), r2=20(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 89
LDI r2, 20
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

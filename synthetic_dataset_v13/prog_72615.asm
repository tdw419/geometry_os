; DESCRIPTION: Renders a purple box of size 83x69 starting at (290, 105).
; PLAN: r0=290(x), r1=105(y), r2=83(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 105
LDI r2, 83
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

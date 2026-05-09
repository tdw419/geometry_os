; DESCRIPTION: Renders a purple box of size 31x75 starting at (136, 46).
; PLAN: r0=136(x), r1=46(y), r2=31(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 46
LDI r2, 31
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

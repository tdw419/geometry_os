; DESCRIPTION: Renders a purple box of size 105x55 starting at (130, 140).
; PLAN: r0=130(x), r1=140(y), r2=105(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 140
LDI r2, 105
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

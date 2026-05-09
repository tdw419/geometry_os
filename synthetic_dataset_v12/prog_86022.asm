; DESCRIPTION: Renders a purple box of size 45x83 starting at (13, 4).
; PLAN: r0=13(x), r1=4(y), r2=45(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 4
LDI r2, 45
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

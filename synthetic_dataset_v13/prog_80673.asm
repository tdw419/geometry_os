; DESCRIPTION: Renders a purple box of size 45x68 starting at (26, 29).
; PLAN: r0=26(x), r1=29(y), r2=45(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 29
LDI r2, 45
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

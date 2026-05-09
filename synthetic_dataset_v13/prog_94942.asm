; DESCRIPTION: Renders a purple box of size 17x68 starting at (437, 6).
; PLAN: r0=437(x), r1=6(y), r2=17(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 6
LDI r2, 17
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

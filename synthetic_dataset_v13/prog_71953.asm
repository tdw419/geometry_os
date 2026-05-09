; DESCRIPTION: Renders a purple box of size 89x40 starting at (361, 22).
; PLAN: r0=361(x), r1=22(y), r2=89(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 22
LDI r2, 89
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

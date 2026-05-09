; DESCRIPTION: Renders a purple box of size 40x23 starting at (7, 18).
; PLAN: r0=7(x), r1=18(y), r2=40(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 18
LDI r2, 40
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

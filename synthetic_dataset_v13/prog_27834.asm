; DESCRIPTION: Renders a purple box of size 51x59 starting at (314, 37).
; PLAN: r0=314(x), r1=37(y), r2=51(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 37
LDI r2, 51
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a purple box of size 25x89 starting at (380, 129).
; PLAN: r0=380(x), r1=129(y), r2=25(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 129
LDI r2, 25
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

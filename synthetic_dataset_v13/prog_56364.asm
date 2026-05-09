; DESCRIPTION: Renders a purple box of size 34x89 starting at (221, 44).
; PLAN: r0=221(x), r1=44(y), r2=34(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 44
LDI r2, 34
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

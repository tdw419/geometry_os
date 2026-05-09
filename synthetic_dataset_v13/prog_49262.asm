; DESCRIPTION: Renders a purple box of size 57x85 starting at (314, 90).
; PLAN: r0=314(x), r1=90(y), r2=57(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 90
LDI r2, 57
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

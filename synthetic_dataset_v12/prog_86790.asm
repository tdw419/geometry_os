; DESCRIPTION: Renders a purple box of size 89x100 starting at (369, 30).
; PLAN: r0=369(x), r1=30(y), r2=89(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 30
LDI r2, 89
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

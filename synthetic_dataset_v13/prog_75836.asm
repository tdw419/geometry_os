; DESCRIPTION: Renders a purple box of size 31x78 starting at (80, 29).
; PLAN: r0=80(x), r1=29(y), r2=31(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 29
LDI r2, 31
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

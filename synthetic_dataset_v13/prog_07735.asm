; DESCRIPTION: Renders a purple box of size 47x36 starting at (200, 2).
; PLAN: r0=200(x), r1=2(y), r2=47(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 2
LDI r2, 47
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a purple box of size 40x60 starting at (111, 118).
; PLAN: r0=111(x), r1=118(y), r2=40(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 118
LDI r2, 40
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

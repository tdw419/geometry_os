; DESCRIPTION: Renders a purple box of size 115x28 starting at (200, 167).
; PLAN: r0=200(x), r1=167(y), r2=115(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 167
LDI r2, 115
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

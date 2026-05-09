; DESCRIPTION: Renders a purple box of size 115x25 starting at (104, 20).
; PLAN: r0=104(x), r1=20(y), r2=115(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 20
LDI r2, 115
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a purple box of size 15x40 starting at (328, 75).
; PLAN: r0=328(x), r1=75(y), r2=15(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 75
LDI r2, 15
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

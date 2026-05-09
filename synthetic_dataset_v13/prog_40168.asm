; DESCRIPTION: Renders a purple box of size 107x100 starting at (5, 7).
; PLAN: r0=5(x), r1=7(y), r2=107(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 7
LDI r2, 107
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

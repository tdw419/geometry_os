; DESCRIPTION: Renders a magenta box of size 12x51 starting at (2, 170).
; PLAN: r0=2(x), r1=170(y), r2=12(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 170
LDI r2, 12
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

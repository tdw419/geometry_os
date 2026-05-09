; DESCRIPTION: Renders a magenta box of size 51x20 starting at (94, 101).
; PLAN: r0=94(x), r1=101(y), r2=51(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 101
LDI r2, 51
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

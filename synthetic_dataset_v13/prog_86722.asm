; DESCRIPTION: Renders a magenta box of size 51x24 starting at (452, 217).
; PLAN: r0=452(x), r1=217(y), r2=51(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 217
LDI r2, 51
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

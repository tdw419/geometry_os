; DESCRIPTION: Renders a magenta box of size 51x102 starting at (36, 36).
; PLAN: r0=36(x), r1=36(y), r2=51(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 36
LDI r2, 51
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

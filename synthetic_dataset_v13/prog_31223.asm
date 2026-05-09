; DESCRIPTION: Renders a magenta box of size 51x12 starting at (247, 135).
; PLAN: r0=247(x), r1=135(y), r2=51(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 135
LDI r2, 51
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a magenta box of size 74x51 starting at (265, 178).
; PLAN: r0=265(x), r1=178(y), r2=74(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 178
LDI r2, 74
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

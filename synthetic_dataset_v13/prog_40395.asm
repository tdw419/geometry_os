; DESCRIPTION: Renders a magenta box of size 14x22 starting at (481, 51).
; PLAN: r0=481(x), r1=51(y), r2=14(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 51
LDI r2, 14
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

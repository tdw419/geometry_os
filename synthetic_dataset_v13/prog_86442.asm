; DESCRIPTION: Renders a magenta box of size 44x71 starting at (51, 6).
; PLAN: r0=51(x), r1=6(y), r2=44(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 6
LDI r2, 44
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

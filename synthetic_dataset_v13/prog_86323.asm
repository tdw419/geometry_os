; DESCRIPTION: Renders a magenta box of size 51x64 starting at (170, 141).
; PLAN: r0=170(x), r1=141(y), r2=51(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 141
LDI r2, 51
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a magenta box of size 98x81 starting at (208, 141).
; PLAN: r0=208(x), r1=141(y), r2=98(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 141
LDI r2, 98
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

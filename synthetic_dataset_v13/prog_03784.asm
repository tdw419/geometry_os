; DESCRIPTION: Renders a magenta box of size 80x14 starting at (141, 141).
; PLAN: r0=141(x), r1=141(y), r2=80(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 141
LDI r2, 80
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a magenta box of size 17x93 starting at (277, 2).
; PLAN: r0=277(x), r1=2(y), r2=17(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 2
LDI r2, 17
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

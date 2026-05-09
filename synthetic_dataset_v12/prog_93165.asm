; DESCRIPTION: Renders a magenta box of size 37x54 starting at (170, 114).
; PLAN: r0=170(x), r1=114(y), r2=37(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 114
LDI r2, 37
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

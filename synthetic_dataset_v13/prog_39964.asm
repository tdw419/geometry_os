; DESCRIPTION: Renders a magenta box of size 80x25 starting at (205, 217).
; PLAN: r0=205(x), r1=217(y), r2=80(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 217
LDI r2, 80
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

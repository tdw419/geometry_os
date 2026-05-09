; DESCRIPTION: Renders a magenta box of size 80x78 starting at (19, 127).
; PLAN: r0=19(x), r1=127(y), r2=80(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 127
LDI r2, 80
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a magenta box of size 98x20 starting at (3, 191).
; PLAN: r0=3(x), r1=191(y), r2=98(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 191
LDI r2, 98
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a magenta box of size 56x19 starting at (389, 25).
; PLAN: r0=389(x), r1=25(y), r2=56(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 25
LDI r2, 56
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

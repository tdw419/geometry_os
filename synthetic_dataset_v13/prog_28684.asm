; DESCRIPTION: Renders a magenta box of size 19x18 starting at (6, 24).
; PLAN: r0=6(x), r1=24(y), r2=19(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 24
LDI r2, 19
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

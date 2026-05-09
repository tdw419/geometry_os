; DESCRIPTION: Renders a magenta box of size 92x97 starting at (126, 2).
; PLAN: r0=126(x), r1=2(y), r2=92(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 2
LDI r2, 92
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

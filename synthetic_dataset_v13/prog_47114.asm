; DESCRIPTION: Renders a magenta box of size 92x85 starting at (326, 4).
; PLAN: r0=326(x), r1=4(y), r2=92(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 4
LDI r2, 92
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

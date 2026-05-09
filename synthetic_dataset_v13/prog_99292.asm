; DESCRIPTION: Renders a magenta box of size 30x36 starting at (163, 119).
; PLAN: r0=163(x), r1=119(y), r2=30(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 119
LDI r2, 30
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

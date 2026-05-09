; DESCRIPTION: Renders a magenta box of size 60x81 starting at (385, 49).
; PLAN: r0=385(x), r1=49(y), r2=60(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 49
LDI r2, 60
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

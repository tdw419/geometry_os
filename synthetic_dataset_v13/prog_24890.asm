; DESCRIPTION: Renders a magenta box of size 35x111 starting at (109, 4).
; PLAN: r0=109(x), r1=4(y), r2=35(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 4
LDI r2, 35
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

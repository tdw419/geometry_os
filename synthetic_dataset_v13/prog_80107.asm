; DESCRIPTION: Renders a purple box of size 10x111 starting at (426, 101).
; PLAN: r0=426(x), r1=101(y), r2=10(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 101
LDI r2, 10
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

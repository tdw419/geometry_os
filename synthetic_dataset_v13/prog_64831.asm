; DESCRIPTION: Renders a blue box of size 25x111 starting at (150, 71).
; PLAN: r0=150(x), r1=71(y), r2=25(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 71
LDI r2, 25
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

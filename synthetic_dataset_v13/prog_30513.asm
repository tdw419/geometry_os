; DESCRIPTION: Renders a blue box of size 106x111 starting at (40, 62).
; PLAN: r0=40(x), r1=62(y), r2=106(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 62
LDI r2, 106
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

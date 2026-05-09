; DESCRIPTION: Renders a blue box of size 23x82 starting at (3, 144).
; PLAN: r0=3(x), r1=144(y), r2=23(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 144
LDI r2, 23
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

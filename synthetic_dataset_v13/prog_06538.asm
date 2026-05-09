; DESCRIPTION: Renders a blue box of size 20x73 starting at (296, 90).
; PLAN: r0=296(x), r1=90(y), r2=20(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 90
LDI r2, 20
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

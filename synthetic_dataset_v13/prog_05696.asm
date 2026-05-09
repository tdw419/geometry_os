; DESCRIPTION: Renders a blue box of size 77x40 starting at (296, 82).
; PLAN: r0=296(x), r1=82(y), r2=77(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 82
LDI r2, 77
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

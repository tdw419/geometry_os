; DESCRIPTION: Renders a purple box of size 49x73 starting at (296, 121).
; PLAN: r0=296(x), r1=121(y), r2=49(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 121
LDI r2, 49
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

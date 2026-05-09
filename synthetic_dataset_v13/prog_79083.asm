; DESCRIPTION: Renders a purple box of size 99x112 starting at (296, 22).
; PLAN: r0=296(x), r1=22(y), r2=99(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 22
LDI r2, 99
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a yellow box of size 88x111 starting at (97, 138).
; PLAN: r0=97(x), r1=138(y), r2=88(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 138
LDI r2, 88
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a yellow box of size 112x43 starting at (347, 135).
; PLAN: r0=347(x), r1=135(y), r2=112(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 135
LDI r2, 112
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

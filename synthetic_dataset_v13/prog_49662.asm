; DESCRIPTION: Renders a yellow box of size 81x55 starting at (113, 105).
; PLAN: r0=113(x), r1=105(y), r2=81(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 105
LDI r2, 81
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

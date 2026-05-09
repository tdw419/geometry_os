; DESCRIPTION: Renders a yellow box of size 115x111 starting at (53, 10).
; PLAN: r0=53(x), r1=10(y), r2=115(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 10
LDI r2, 115
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

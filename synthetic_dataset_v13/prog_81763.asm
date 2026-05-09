; DESCRIPTION: Renders a yellow box of size 92x35 starting at (334, 53).
; PLAN: r0=334(x), r1=53(y), r2=92(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 53
LDI r2, 92
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a yellow box of size 10x53 starting at (347, 28).
; PLAN: r0=347(x), r1=28(y), r2=10(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 28
LDI r2, 10
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

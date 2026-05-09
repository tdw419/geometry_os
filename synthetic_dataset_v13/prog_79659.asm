; DESCRIPTION: Renders a yellow box of size 53x111 starting at (222, 82).
; PLAN: r0=222(x), r1=82(y), r2=53(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 82
LDI r2, 53
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

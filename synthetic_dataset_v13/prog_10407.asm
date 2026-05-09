; DESCRIPTION: Renders a yellow box of size 98x53 starting at (263, 100).
; PLAN: r0=263(x), r1=100(y), r2=98(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 100
LDI r2, 98
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

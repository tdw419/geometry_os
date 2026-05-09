; DESCRIPTION: Renders a yellow box of size 25x53 starting at (385, 33).
; PLAN: r0=385(x), r1=33(y), r2=25(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 33
LDI r2, 25
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a yellow box of size 57x72 starting at (53, 39).
; PLAN: r0=53(x), r1=39(y), r2=57(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 39
LDI r2, 57
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

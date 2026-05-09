; DESCRIPTION: Renders a yellow box of size 48x53 starting at (145, 201).
; PLAN: r0=145(x), r1=201(y), r2=48(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 201
LDI r2, 48
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

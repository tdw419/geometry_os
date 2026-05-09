; DESCRIPTION: Renders a yellow box of size 100x64 starting at (93, 84).
; PLAN: r0=93(x), r1=84(y), r2=100(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 84
LDI r2, 100
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
